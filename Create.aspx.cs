﻿using System;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;
using System.Globalization;
using System.Threading;
using System.Web.UI.WebControls;

public partial class Create : System.Web.UI.Page
{
	protected void Page_Load(object sender, EventArgs e)
	{
	    var clientIDTextBox = (TextBox)FormView1.FindControl("ClientIDTextBox");
         clientIDTextBox.Text = ConfigurationManager.AppSettings["CLIENT_ID"];
	}

    protected override void InitializeCulture()
    {
        CultureInfo CI = new CultureInfo("en-IN");
        CI.DateTimeFormat.ShortDatePattern = "dd-MM-yyyy";

        Thread.CurrentThread.CurrentCulture = CI;
        Thread.CurrentThread.CurrentUICulture = CI;
        base.InitializeCulture();
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

		string ClientID = ConfigurationManager.AppSettings["SubscriptionID"];

		var newAsset = GetAssetFromDb(Decimal.ToInt32((decimal)AssetID));

		if (newAsset == null)
		{
			return;
		}

		try
		{
			if (!RestServiceHelper.InvokePostGlobalAsset(newAsset))
			{
				ErrorMsg.Text = "Asset Added. Failed to update Global Asset Service.";
			}

			if (!RestServiceHelper.InvokePost(newAsset.ClientID, newAsset.AssetType, newAsset.AssetSubType))
			{
				ErrorMsg.Text = "Asset Added. Failed to update Global Asset Counter Service.";
			}
		}
		catch (Exception exception)
		{
			System.Diagnostics.Trace.WriteLine(exception.Message);
			System.Diagnostics.Trace.WriteLine(exception.InnerException.Message);
			System.Diagnostics.Trace.WriteLine(exception.StackTrace);
			ErrorMsg.Text = "Asset Added. Failed to update Global Asset Counter Service." + exception.GetDisplayMessage();
		}

		string URL = "AssetDetail.aspx?ID=" + Convert.ToString(AssetID);

		if (!string.IsNullOrEmpty(ErrorMsg.Text))
		{
			URL = string.Concat(URL, "&ErrorMessage=", ErrorMsg.Text);
		}

		Response.Redirect(URL);
	}

	private GlobalAsset GetAssetFromDb(int assetId)
	{
		string conString = System.Configuration.ConfigurationManager.ConnectionStrings["sqlConnectionString"].ToString();
		SqlConnection sqlConn = new SqlConnection(conString);
		sqlConn.Open();
		SqlCommand command = new SqlCommand("usp_GetAsset", sqlConn);
		command.CommandType = CommandType.StoredProcedure;
		command.Parameters.Add("@AssetID", SqlDbType.Int).Value = assetId;

		SqlDataAdapter sqlAdapter = new SqlDataAdapter(command);
		DataSet myDataset = new DataSet();
		sqlAdapter.Fill(myDataset);
		sqlConn.Close();

		if (myDataset.Tables.Count == 0 || myDataset.Tables[0].Rows.Count == 0)
		{
			return null;
		}

		DataRow dRow = myDataset.Tables[0].Rows[0];

		string assetType = dRow["AssetTypeInt"].ToString();
		string assetSubType = dRow["AssetSubTypeInt"].ToString();
		string assetName = dRow["Name"].ToString();
		string ClientID = dRow["ClientID"].ToString();
		string statusStr = dRow["Status"].ToString();
		string LastServiceDateStr = dRow["LastServiceDate"].ToString();
		string NextServiceDateStr = dRow["NextServiceDate"].ToString();

		Nullable<System.DateTime> lastServiceDate = null;
		Nullable<System.DateTime> nextServiceDate = null;

		DateTime dt;
		if (DateTime.TryParse(LastServiceDateStr, out dt))
		{
			lastServiceDate = dt;
		}

		if (DateTime.TryParse(NextServiceDateStr, out dt))
		{
			nextServiceDate = dt;
		}

		var updatedAsset = new GlobalAsset
		{
			AssetID = assetId,
			AssetType = int.Parse(assetType),
			AssetSubType = int.Parse(assetSubType),
			ClientID = ClientID,
			SerialNumber = assetName,
			LastServiceDate = lastServiceDate,
			NextServiceDate = nextServiceDate,
			Status = statusStr
		};
		return updatedAsset;
	}
}
