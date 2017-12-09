using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class AssetConfig : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
       if (!IsPostBack) { 
           //Not postback...
           
       }
       if (ListView1.SelectedIndex < 0)
       {
           ListView2.Visible = false;
           AssetTypePropertyMessage.Visible = true;
           ListView3.Visible = false;
           AssetSubTypeMessage.Visible = true;
           ListView4.Visible = false;
           AssetSubTypePropertyMessage.Visible = true;
           ListView5.Visible = false;
           AssetTypePropertyValueLookupMessage.Visible = true;
           ListView6.Visible = false;
           AssetSubTypePropertyValueLookupMessage.Visible = true;


       }
       else
       {
           ListView2.Visible = true;
           AssetTypePropertyMessage.Visible = false;
           ListView3.Visible = true;
           AssetSubTypeMessage.Visible = false;
           ListView4.Visible = true;
           AssetSubTypePropertyMessage.Visible = false;
       }
       if (ListView2.SelectedIndex < 0)
       {
           ListView5.Visible = false;
           AssetTypePropertyValueLookupMessage.Visible = true;
           ListView6.Visible = false;
           AssetSubTypePropertyValueLookupMessage.Visible = true;
       }
       else
       {
           ListView5.Visible = true;
           AssetTypePropertyValueLookupMessage.Visible = false;
           ListView6.Visible = true;
           AssetSubTypePropertyValueLookupMessage.Visible = false;
       }
       if (ListView3.SelectedIndex < 0)
       {
           ListView4.Visible = false;
           AssetSubTypePropertyMessage.Visible = true;
       }
       if (ListView4.SelectedIndex < 0)
       {
           ListView6.Visible = false;
           AssetSubTypePropertyValueLookupMessage.Visible = true;
       }
       else
       {
           ListView6.Visible = true;
           AssetSubTypePropertyValueLookupMessage.Visible = false;
       }
        
    }

    protected void ListView1_SelectedIndexChanged(object sender, EventArgs e)
    {
        ListView2.Visible = true;
        AssetTypePropertyMessage.Visible = false;
        ListView3.Visible = true;
        AssetSubTypeMessage.Visible = false;
        ListView4.Visible = false;
        AssetSubTypePropertyMessage.Visible = true;
        ListView3.SelectedIndex = -1;
        
        
    }
    protected void ListView3_SelectedIndexChanged(object sender, EventArgs e)
    {
        ListView4.Visible = true;
        AssetSubTypePropertyMessage.Visible = false;
    }
    protected void ListView2_SelectedIndexChanged(object sender, EventArgs e)
    {
        ListView5.Visible = true;
        AssetTypePropertyValueLookupMessage.Visible = false;
    }
    protected void ListView4_SelectedIndexChanged(object sender, EventArgs e)
    {
        ListView6.Visible = true;
        AssetSubTypePropertyValueLookupMessage.Visible = false;
    }
    protected void ListView2_ItemInserting(object sender, ListViewInsertEventArgs e)
    {
        e.Values["AssetType"] = ListView1.SelectedDataKey[0];
    }
    protected void ListView3_ItemInserting(object sender, ListViewInsertEventArgs e)
    {
        e.Values["AssetType"] = ListView1.SelectedDataKey[0];
    }
    protected void ListView4_ItemInserting(object sender, ListViewInsertEventArgs e)
    {
        e.Values["AssetSubType"] = ListView3.SelectedDataKey[0];
    }
     protected void ListView5_ItemInserting(object sender, ListViewInsertEventArgs e)
    {
        e.Values["PropertyType"] = ListView2.SelectedDataKey[0];
    }
    protected void ListView6_ItemInserting(object sender, ListViewInsertEventArgs e)
    {
        e.Values["PropertySubType"] = ListView4.SelectedDataKey[0];
    }
}