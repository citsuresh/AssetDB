using System;
using System.Globalization;
using System.Threading;
using System.Web.UI.WebControls;

public partial class Assets : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (TextBox1.Text == "")
        {
            SqlAssets.FilterExpression = "(AssetType Like '%{0}%' and AssetSubType Like '%{1}%')";
        }
        else
        {
            SqlAssets.FilterExpression = "(AssetType Like '%{0}%' and AssetSubType Like '%{1}%' and Name Like '%{2}%')";
        }
    }

    protected override void InitializeCulture()
    {
        CultureInfo CI = new CultureInfo("en-IN");
        CI.DateTimeFormat.ShortDatePattern = "dd-MM-yyyy";

        Thread.CurrentThread.CurrentCulture = CI;
        Thread.CurrentThread.CurrentUICulture = CI;
        base.InitializeCulture();
    }

    protected void GridView1_SelectedIndexChanged(object sender, EventArgs e)
    {
        string AssetID = GridView1.SelectedValue.ToString();
        string URL = "AssetDetail.aspx?ID=" + Convert.ToString(AssetID);
        Response.Redirect(URL); 
    }
   
    protected void GridView1_RowDataBound(object sender, GridViewRowEventArgs e)
    {

 if (e.Row.RowType == DataControlRowType.DataRow)
        {
e.Row.Attributes.Add("onmouseover", "javascript:NAC_ChangeBackColor(this, true, '#BAD5E8'); this.style.cursor = 'pointer';");
e.Row.Attributes.Add("onmouseout", "javascript:NAC_ChangeBackColor(this, false, '');");
e.Row.Attributes.Add("onclick", ClientScript.GetPostBackClientHyperlink(this.GridView1, "Select$" + e.Row.RowIndex));
        }
    }

    protected void AssetTypeDropDownList_SelectedIndexChanged(object sender, EventArgs e)
    {
        AssetSubTypeDropDownList.Items.Clear();
        //AssetSubTypeDropDownList.DataBind();
        AssetSubTypeDropDownList.Items.Add(new ListItem("Please Select", "%"));
    }
}
