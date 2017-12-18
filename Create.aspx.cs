using System;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;
using System.Web.UI.WebControls;


public partial class Create : System.Web.UI.Page
{
	protected void Page_Load(object sender, EventArgs e)
	{

	}

	protected void FormView1_ItemInserting(object sender, FormViewInsertEventArgs e)
	{

		DropDownList ddl = (DropDownList)FormView1.FindControl("AssetTypeDropDownList");
		DropDownList ddl2 = (DropDownList)FormView1.FindControl("AssetSubTypeDropDownList");

		if (ddl.SelectedValue.ToString() == "" || ddl2.SelectedValue.ToString() == "")
		{
			e.Cancel = true;
			ErrorMsg.Text = "No asset type or sub type selected";
		}
		else
		{
			try
			{
				int atval;
				atval = Convert.ToInt32(ddl.SelectedValue);
				e.Values["AssetType"] = atval;

				int atval2;
				atval2 = Convert.ToInt32(ddl2.SelectedValue);
				e.Values["AssetSubType"] = atval2;
			}
			catch (Exception ex)
			{
				e.Cancel = true;
				ErrorMsg.Text = ex.ToString();

			}
		}
	}
	protected void FormView1_ItemInserted(object sender, FormViewInsertedEventArgs e)
	{
		string conString = System.Configuration.ConfigurationManager.ConnectionStrings["sqlConnectionString"].ToString();
		SqlConnection sqlConn = new SqlConnection(conString);
		object AssetID;
		SqlCommand command = new SqlCommand("usp_GetLastAssetID", sqlConn);
		command.CommandType = CommandType.StoredProcedure;
		sqlConn.Open();
		AssetID = command.ExecuteScalar();
		sqlConn.Close();

		string clientIdentifier = ConfigurationManager.AppSettings["SubscriptionID"]; ;
		Nullable<System.DateTime> lastServiceDate = null;
		Nullable<System.DateTime> nextServiceDate = null;

		DateTime dt;
		if (DateTime.TryParse(e.Values["StartDate"].ToString(), out dt))
		{
			lastServiceDate = dt;
		}

		if (DateTime.TryParse(e.Values["EndDate"].ToString(), out dt))
		{
			nextServiceDate = dt;
		}

		if (!RestServiceHelper.InvokePost(new GlobalAsset{AssetType = (int)e.Values["AssetType"] , AssetSubType = (int)e.Values["AssetSubType"], ClientIdentifier = clientIdentifier, SerialNumber = e.Values["Name"].ToString(), LastServiceDate = lastServiceDate, NextServiceDate = nextServiceDate, Status = e.Values["Status"].ToString() }))
		{
			ErrorMsg.Text = "Asset Added. Failed to update Global Asset Service.";
		}

		//if (!RestServiceHelper.InvokePost((int)e.Values["AssetSubType"], (int)e.Values["AssetType"]))
		//{
		//	//return;
		//}

		string URL = "AssetDetail.aspx?ID=" + Convert.ToString(AssetID);

		if (!string.IsNullOrEmpty(ErrorMsg.Text))
		{
			URL = string.Concat(URL, "&ErrorMessage=", ErrorMsg.Text);
		}

		Response.Redirect(URL);
	}
}
