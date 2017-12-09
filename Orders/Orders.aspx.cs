using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class Orders : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {

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

    protected void GridView1_SelectedIndexChanged(object sender, EventArgs e)
    {
        string OrderID = GridView1.SelectedValue.ToString();
        string URL = "OrderDetail.aspx?ID=" + Convert.ToString(OrderID);
        Response.Redirect(URL);
    }
}