using System;
using System.Configuration;
using System.Web.Configuration;

public partial class _Default : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
	    Configuration configuration = WebConfigurationManager.OpenWebConfiguration("~");
	    ConnectionStringsSection connectionStringsSection = (ConnectionStringsSection) configuration.GetSection("connectionStrings");
		connectionStringsSection.SectionInformation.ProtectSection("DataProtectionConfigurationProvider");
		configuration.Save();

		////< connectionStrings >
		////< add name = "ApplicationServices" connectionString = "data source=tcp:assetdbazuresample.database.windows.net,1433;initial catalog=AssetDBAzureSample;user id=AssetDBAdmin@assetdbazuresample.database.windows.net;password=Mtts1000;MultipleActiveResultSets=False;Timeout=60" providerName = "System.Data.SqlClient" />
		////< add name = "SQLConnectionString" connectionString = "data source=tcp:assetdbazuresample.database.windows.net,1433;initial catalog=AssetDBAzureSample;user id=AssetDBAdmin@assetdbazuresample.database.windows.net;password=Mtts1000;MultipleActiveResultSets=False;Timeout=60" providerName = "System.Data.SqlClient" />
		////</ connectionStrings >
	}
}
