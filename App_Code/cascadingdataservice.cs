using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Services;
using System.Data.SqlClient;
using System.Web.Configuration;
using System.Data;
using AjaxControlToolkit;
using System.Collections.Specialized;

/// <summary>
/// Summary description for cascadingdataservice
/// </summary>
[WebService(Namespace = "http://tempuri.org/")]
[WebServiceBinding(ConformsTo = WsiProfiles.BasicProfile1_1)]
// To allow this Web Service to be called from script, using ASP.NET AJAX, uncomment the following line. 
[System.Web.Script.Services.ScriptService]
public class cascadingdataservice : System.Web.Services.WebService {
    string conString = System.Configuration.ConfigurationManager.ConnectionStrings["sqlConnectionString"].ToString();

    public cascadingdataservice () {

        //Uncomment the following line if using designed components 
        //InitializeComponent(); 
    }


    [WebMethod]
    public AjaxControlToolkit.CascadingDropDownNameValue[] GetAssets(string knownCategoryValues, string category)
    {
        SqlConnection sqlConn = new SqlConnection(conString);
        sqlConn.Open();
        SqlCommand command = new SqlCommand("usp_LookupAssetType", sqlConn);
        command.CommandType = CommandType.StoredProcedure;
        SqlDataAdapter sqlAdapter = new SqlDataAdapter(command);
        DataSet myDataset = new DataSet();
        sqlAdapter.Fill(myDataset);
        sqlConn.Close();

        List<AjaxControlToolkit.CascadingDropDownNameValue> cascadingValues = new List<AjaxControlToolkit.CascadingDropDownNameValue>();

        foreach (DataRow dRow in myDataset.Tables[0].Rows)
        {
            string TypeID = dRow["AssetTypeID"].ToString();
            string TypeName = dRow["AssetType"].ToString();
            cascadingValues.Add(new AjaxControlToolkit.CascadingDropDownNameValue(TypeName, TypeID));
        }

        return cascadingValues.ToArray();
    }

    [WebMethod]
    public AjaxControlToolkit.CascadingDropDownNameValue[] GetDropDownSubType(string knownCategoryValues, string category)
    {
        int AssetType;

        StringDictionary categoryValues = AjaxControlToolkit.CascadingDropDown.ParseKnownCategoryValuesString(knownCategoryValues);

        AssetType = Convert.ToInt32(categoryValues["category"]);




        SqlConnection sqlConn = new SqlConnection(conString);
        sqlConn.Open();
        SqlCommand command = new SqlCommand("usp_LookupAssetSubType", sqlConn);
        command.CommandType = CommandType.StoredProcedure;
        command.Parameters.Add("@AssetType", SqlDbType.Int).Value = AssetType;

        SqlDataAdapter sqlAdapter = new SqlDataAdapter(command);
        DataSet myDataset = new DataSet();
        sqlAdapter.Fill(myDataset);
        sqlConn.Close();

        List<AjaxControlToolkit.CascadingDropDownNameValue> cascadingValues = new List<AjaxControlToolkit.CascadingDropDownNameValue>();

        foreach (DataRow dRow in myDataset.Tables[0].Rows)
        {
            string AssetSubTypeID = dRow["AssetSubTypeID"].ToString();
            string AssetSubTypeName = dRow["AssetSubType"].ToString();
            cascadingValues.Add(new AjaxControlToolkit.CascadingDropDownNameValue(AssetSubTypeName, AssetSubTypeID));
        }

        return cascadingValues.ToArray();
    }
}
