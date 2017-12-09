using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.SqlClient;
using System.IO;
using System.Web.Configuration;
using System.Data;
using AjaxControlToolkit;

public partial class AssetDetail : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
            PopulateRootLevel();
        }
    }

    [System.Web.Services.WebMethodAttribute(), System.Web.Script.Services.ScriptMethodAttribute()]
    public static string[] getTypeLookupValues(string prefixText, int count, string contextKey)
    {

        
        string ConnectionString = WebConfigurationManager.ConnectionStrings["SQLConnectionString"].ConnectionString;
        SqlConnection cmd1 = new SqlConnection(ConnectionString);
        SqlCommand command = new SqlCommand("usp_getTypeLookupValues", cmd1);
        command.CommandType = CommandType.StoredProcedure;
        command.Parameters.Add("@PrefixText", SqlDbType.NVarChar).Value = prefixText + "%";
        command.Parameters.Add("@PropertyType", SqlDbType.Int).Value = contextKey;
        SqlDataAdapter adapter = new SqlDataAdapter(command);
        DataTable dt = new DataTable();
        adapter.Fill(dt);
        string[] items = new string[dt.Rows.Count];
        int i = 0;
        foreach (DataRow dr in dt.Rows)
        {
            items.SetValue(dr["LookupValue"].ToString(), i);
            i++;
        }

        return items;
    }

    [System.Web.Services.WebMethodAttribute(), System.Web.Script.Services.ScriptMethodAttribute()]
    public static string[] getSubTypeLookupValues(string prefixText, int count, string contextKey)
    {


        string ConnectionString = WebConfigurationManager.ConnectionStrings["SQLConnectionString"].ConnectionString;
        SqlConnection cmd1 = new SqlConnection(ConnectionString);
        SqlCommand command = new SqlCommand("usp_getSubTypeLookupValues", cmd1);
        command.CommandType = CommandType.StoredProcedure;
        command.Parameters.Add("@PrefixText", SqlDbType.NVarChar).Value = prefixText + "%";
        command.Parameters.Add("@PropertySubType", SqlDbType.Int).Value = contextKey;
        SqlDataAdapter adapter = new SqlDataAdapter(command);
        DataTable dt = new DataTable();
        adapter.Fill(dt);
        string[] items = new string[dt.Rows.Count];
        int i = 0;
        foreach (DataRow dr in dt.Rows)
        {
            items.SetValue(dr["LookupValue"].ToString(), i);
            i++;
        }

        return items;
    }
    protected void UpdateButton_Click(object sender, EventArgs e)
    {
        SqlConnection connection = new SqlConnection(WebConfigurationManager.ConnectionStrings["SQLConnectionString"].ToString());



        //Loop thru gridview rows and fill Update requests
        try
        {
            foreach (GridViewRow row in GridView1.Rows)
            {
                SqlCommand cmd1 = new SqlCommand("usp_UpdateAssetTypeValues", connection);
                cmd1.CommandType = CommandType.StoredProcedure;
                cmd1.Parameters.Add("@AssetTypePropertyValueID", SqlDbType.Int).Value = Convert.ToInt32(((Label)row.FindControl("AssetTypePropertyValueIDLabel")).Text);
                cmd1.Parameters.Add("@AssetTypePropertyValue", SqlDbType.NVarChar).Value = ((TextBox)row.FindControl("AssetTypePropertyValueTextBox")).Text;
                connection.Open();
                cmd1.ExecuteNonQuery();
                connection.Close();

            }
        }
        catch (Exception ex)
        {
            ErrorMsg.Text = ex.ToString();

        }
        this.UpdatePanel1.Update();
       


    }
   
    protected void UpdateSubButton_Click(object sender, EventArgs e)
    {
        SqlConnection connection = new SqlConnection(WebConfigurationManager.ConnectionStrings["SQLConnectionString"].ToString());



        //Loop thru gridview rows and fill Update requests
        try
        {
            foreach (GridViewRow row in GridView2.Rows)
            {
                SqlCommand cmd1 = new SqlCommand("usp_UpdateAssetSubTypeValues", connection);
                cmd1.CommandType = CommandType.StoredProcedure;
                cmd1.Parameters.Add("@AssetSubTypePropertyValueID", SqlDbType.Int).Value = Convert.ToInt32(((Label)row.FindControl("AssetSubTypePropertyValueIDLabel")).Text);
                cmd1.Parameters.Add("@AssetSubTypePropertyValue", SqlDbType.NVarChar).Value = ((TextBox)row.FindControl("AssetSubTypePropertyValueTextBox")).Text;
                connection.Open();
                cmd1.ExecuteNonQuery();
                connection.Close();

            }
        }
        catch (Exception ex)
        {
            ErrorMsg.Text = ex.ToString();

        }
        this.UpdatePanel2.Update();
    }

    protected void GridView1_RowDataBound(object sender, GridViewRowEventArgs e)
    {
        AutoCompleteExtender ACE = (AutoCompleteExtender)e.Row.FindControl("AssetTypePropertyValueTextBox_AutoCompleteExtender");
        if (ACE != null)
        {
                        ACE.ContextKey = e.Row.Cells[2].Text;
                 
        }
    }
    protected void GridView2_RowDataBound(object sender, GridViewRowEventArgs e)
    {
        AutoCompleteExtender ACE = (AutoCompleteExtender)e.Row.FindControl("AssetSubTypePropertyValueTextBox_AutoCompleteExtender");
        if (ACE != null)
        {
            ACE.ContextKey = e.Row.Cells[2].Text;

        }
    }


    protected void LinkButton2_Click(object sender, EventArgs e)
    {
        UpdatePanel5_PopupControlExtender.Cancel();
    }
    protected void LinkButton1_Click(object sender, EventArgs e)
    {
        if ((FileUpload1.PostedFile == null) || (FileUpload1.PostedFile.InputStream == null))
        {
            // ... Show error message ...
            LabelErr.Text = " Problem with file or no file selected.";
            return;
        }

        string extension = Path.GetExtension(FileUpload1.PostedFile.FileName).ToLower();
        Int32 ConLength = Convert.ToInt32(FileUpload1.PostedFile.ContentLength.ToString());

        SqlConnection connection = new SqlConnection(WebConfigurationManager.ConnectionStrings["SQLConnectionString"].ToString());



        //Loop thru gridview rows and fill Update requests
        try
        {

                SqlCommand cmd1 = new SqlCommand("usp_DocumentMimeTypesSelect", connection);
                cmd1.CommandType = CommandType.StoredProcedure;
                cmd1.Parameters.Add("@Extension", SqlDbType.NVarChar).Value = extension;
                SqlDataAdapter adapter = new SqlDataAdapter(cmd1);
                DataTable dt = new DataTable();
                adapter.Fill(dt);
                int itemCount = dt.Rows.Count;
                if (itemCount < 1 )
                {
                    LabelErr.Text = "Invalid file type";
                    return;
                }


        }
        catch (Exception ex)
        {
            ErrorMsg.Text = ex.ToString();

        }
               

     

        using (SqlConnection myConnection = new SqlConnection(System.Configuration.ConfigurationManager.ConnectionStrings["sqlConnectionString"].ToString()))
        {
            SqlCommand cmd1 = new SqlCommand("usp_DocumentsInsert", myConnection);
            cmd1.CommandType = CommandType.StoredProcedure;
            cmd1.Parameters.AddWithValue("@Title", DocumentTitle.Text.Trim());
            cmd1.Parameters.AddWithValue("@Extension", extension);
            cmd1.Parameters.AddWithValue("@AssetID", Request.QueryString["ID"].ToString());
            cmd1.Parameters.AddWithValue("@ContentLength", ConLength);

            //Load FileUpload's InputStream into Byte array
            byte[] docBytes = new byte[FileUpload1.PostedFile.InputStream.Length + 1];
            FileUpload1.PostedFile.InputStream.Read(docBytes, 0, docBytes.Length);
            cmd1.Parameters.AddWithValue("@Data", docBytes);

            myConnection.Open();
            cmd1.ExecuteNonQuery();
            myConnection.Close();



        }




    }
    protected void GridView3_SelectedIndexChanged(object sender, EventArgs e)
    {
        
         string DocumentID = GridView3.SelectedValue.ToString(); //-- if something was passed to the file querystring
        if (DocumentID != "")
        {


            using (SqlConnection myConnection = new SqlConnection(System.Configuration.ConfigurationManager.ConnectionStrings["sqlConnectionString"].ToString()))
            {
                SqlCommand cmd1 = new SqlCommand("usp_DocumentOpen", myConnection);
                cmd1.CommandType = CommandType.StoredProcedure;
                cmd1.Parameters.AddWithValue("@ID", DocumentID);

                myConnection.Open();
                SqlDataReader myReader = cmd1.ExecuteReader();

                if (myReader.Read()) // found our image
                {
                    string filetitle =  myReader["Title"].ToString() ;
                    Response.Clear();
                    Response.AddHeader("Content-Disposition", "inline;filename=" + filetitle );
                    Response.ContentType = myReader["MIMEType"].ToString();
                    int ContentLength = Convert.ToInt32(myReader["ContentLength"].ToString());
                    Response.ContentEncoding = System.Text.Encoding.GetEncoding("Windows-1252");
                    Response.OutputStream.Write((byte[])myReader["Data"], 0, ContentLength);

                    Response.Flush();
                    Response.Close();
                }

                myReader.Close();
                myConnection.Close();

            }

        }
        else
        {
            //nothing in the URL as HTTP GET
            Response.Write("Please provide a file to download.");
        }
    }
    private void PopulateRootLevel()
    {

        string ConnectionString = WebConfigurationManager.ConnectionStrings["SQLConnectionString"].ConnectionString;
        SqlConnection con = new SqlConnection(ConnectionString);
        SqlCommand command = new SqlCommand("usp_AssetRelationshipHierarchyParent", con);
        command.CommandType = CommandType.StoredProcedure;
        command.Parameters.Add("@Assetid", SqlDbType.Int).Value = Request.QueryString["ID"];
        SqlDataAdapter adapter = new SqlDataAdapter(command);
        DataTable dt = new DataTable();
        adapter.Fill(dt);
        PopulateNodes(dt, TreeView1.Nodes);
    }
    private void PopulateNodes(DataTable dt, TreeNodeCollection nodes)
    {
       
        foreach (DataRow dr in dt.Rows)
        {
           
            TreeNode tn = new TreeNode();
            tn.Text = dr["AssetName"].ToString();
            tn.Value = dr["AssetID"].ToString();
            tn.NavigateUrl = "AssetDetail.aspx?id=" + tn.Value;
            nodes.Add(tn);

            //If <strong class="highlight">node</strong> has child nodes, then enable on-demand populating
            tn.PopulateOnDemand = ((int)dr["childnodecount"] > 0);
        
        }

    }

    private void PopulateSubLevel(int parentid,int assetid, TreeNode parentNode)
    {
        string ConnectionString = WebConfigurationManager.ConnectionStrings["SQLConnectionString"].ConnectionString;
        SqlConnection con = new SqlConnection(ConnectionString);
        SqlCommand command = new SqlCommand("usp_AssetRelationshipHierarchyChild", con);
        command.CommandType = CommandType.StoredProcedure;
        command.Parameters.Add("@parentid", SqlDbType.Int).Value = parentid;
        command.Parameters.Add("@assetid", SqlDbType.Int).Value = assetid;

        SqlDataAdapter da = new SqlDataAdapter(command);
        DataTable dt = new DataTable();
        da.Fill(dt);
        PopulateNodes(dt, parentNode.ChildNodes);
    }
    protected void TreeView1_TreeNodePopulate(object sender, TreeNodeEventArgs e)
    {
        int assetid = Convert.ToInt16(Request.QueryString["ID"].ToString());
        PopulateSubLevel(Convert.ToInt32(e.Node.Value),assetid, e.Node);
    }
    protected void AssetTypeDropDownList_SelectedIndexChanged(object sender, EventArgs e)
    {
        AssetSubTypeDropDownList.Items.Clear();
        //AssetSubTypeDropDownList.DataBind();
        AssetSubTypeDropDownList.Items.Add(new ListItem("Please Select", "%"));

    }
    protected void AddButton_Click(object sender, EventArgs e)
    {
        using (SqlConnection myConnection = new SqlConnection(System.Configuration.ConfigurationManager.ConnectionStrings["sqlConnectionString"].ToString()))
        {
            SqlCommand cmd1 = new SqlCommand("usp_AssetRelationshipInsert", myConnection);
            cmd1.CommandType = CommandType.StoredProcedure;
            cmd1.Parameters.AddWithValue("@AssetID", Request.QueryString["ID"].ToString());
            cmd1.Parameters.AddWithValue("@RelatedAssetID", DropDownListRelatedAsset.SelectedValue);

            myConnection.Open();
            cmd1.ExecuteNonQuery();
            myConnection.Close();

            Response.Redirect("AssetDetail.aspx?ID=" + Request.QueryString["ID"].ToString());

        }
    }
    protected void TreeView1_TreeNodeCheckChanged(object sender, TreeNodeEventArgs e)
    {
        using (SqlConnection myConnection = new SqlConnection(System.Configuration.ConfigurationManager.ConnectionStrings["sqlConnectionString"].ToString()))
        {
            SqlCommand cmd1 = new SqlCommand("usp_AssetRelationshipDelete", myConnection);
            cmd1.CommandType = CommandType.StoredProcedure;
            cmd1.Parameters.AddWithValue("@AssetID", Convert.ToInt16(e.Node.Parent.Value.ToString()));
            cmd1.Parameters.AddWithValue("@RelatedAssetID", Convert.ToInt16(e.Node.Value.ToString()));

            myConnection.Open();
            cmd1.ExecuteNonQuery();
            myConnection.Close();



        }
        
    }
    protected void LinkButtonDelete_Click(object sender, EventArgs e)
    {
       /* TreeView tn = TreeView1;
        using (SqlConnection myConnection = new SqlConnection(System.Configuration.ConfigurationManager.ConnectionStrings["sqlConnectionString"].ToString()))
        {
            
            for (int ndx = tn.Nodes.Count; ndx > 0; ndx--)
            {
                TreeNode node = tn.Nodes[ndx - 1];
                TreeNode parentnode = tn.Nodes[ndx - 1].Parent;
                if (node.Checked)
                {   
                    
                    SqlCommand cmd1 = new SqlCommand("usp_AssetRelationshipDelete", myConnection);
                    cmd1.CommandType = CommandType.StoredProcedure;
                    cmd1.Parameters.AddWithValue("@AssetID", Convert.ToInt16(node.Parent.Value.ToString()));
                    cmd1.Parameters.AddWithValue("@RelatedAssetID", Convert.ToInt16(node.Value.ToString()));

                    myConnection.Open();
                    cmd1.ExecuteNonQuery();
                    myConnection.Close();
                    
                }
                // Recurse through the child nodes...
            }

           



        }*/
        Response.Redirect("AssetDetail.aspx?ID=" + Request.QueryString["ID"].ToString());
    }
   

}