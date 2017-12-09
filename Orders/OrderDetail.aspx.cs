using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class Orders_OrderDetail : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {

    }


    protected void FormViewOrder_DataBound(object sender, EventArgs e)
    {
        TextBox tb = (TextBox)FormViewOrder.Row.FindControl("TextType1");

        if (tb.Text == "Hardware")
        {
            PanelHardware.Enabled = Convert.ToBoolean("True");
            PanelHardware.Visible = Convert.ToBoolean("True");
            PanelSoftware.Enabled = Convert.ToBoolean("False");
            PanelSoftware.Visible = Convert.ToBoolean("False");
        }
        else if (tb.Text == "Software")
        {

            PanelHardware.Visible = Convert.ToBoolean("False");
            ListView1.Visible = Convert.ToBoolean("False");
            PanelSoftware.Visible = Convert.ToBoolean("True");
            ListView2.Visible = Convert.ToBoolean("True");

        }
        else
        {
            PanelHardware.Enabled = Convert.ToBoolean("False");
            PanelHardware.Visible = Convert.ToBoolean("False");
            PanelSoftware.Enabled = Convert.ToBoolean("False");
            PanelSoftware.Visible = Convert.ToBoolean("False");
        }
    }
    protected void ListView1_ItemInserting(object sender, ListViewInsertEventArgs e)
    {
        e.Values["OrderID"] = Request.QueryString["ID"];
    }
    protected void ListView1_ItemUpdating(object sender, ListViewUpdateEventArgs e)
    {
        e.NewValues["OrderID"] = Request.QueryString["ID"];
        
    }
    protected void ListView2_ItemInserting(object sender, ListViewInsertEventArgs e)
    {
        e.Values["OrderID"] = Request.QueryString["ID"];
    }
    protected void ListView2_ItemUpdating(object sender, ListViewUpdateEventArgs e)
    {
        e.NewValues["OrderID"] = Request.QueryString["ID"];
    }
}

