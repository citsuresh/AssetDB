using System;
using System.Collections.Generic;
using System.Configuration;
using System.Linq;
using System.Net.Http;
using System.Net.Http.Headers;
using System.Web;

/// <summary>
/// Summary description for RestServiceHelper
/// </summary>
public static partial class RestServiceHelper
{
	public static void InvokeGet()
	{
		try
		{
			HttpClient client = new HttpClient();
			client.BaseAddress = new Uri(GetRestServiceBaseAddress());

			// Add an Accept header for JSON format.
			client.DefaultRequestHeaders.Accept.Add(
				new MediaTypeWithQualityHeaderValue("application/json"));

			HttpResponseMessage response = client.GetAsync("values").Result;

			if (response.IsSuccessStatusCode)
			{
				var assetCounters = response.Content.ReadAsAsync<IEnumerable<AssetCounter>>().Result;

				foreach (var assetCounter in assetCounters)
				{
				}
			}
		}
		catch (Exception)
		{
		}
	}
	
	public static bool InvokePost(string ClientID, int assetType, int subAssetType, int count = 1)
	{
		try
		{
			HttpClient client = new HttpClient();
			client.BaseAddress = new Uri(GetRestServiceBaseAddress());

			client.DefaultRequestHeaders.Accept.Add(
				new MediaTypeWithQualityHeaderValue("application/json"));

			var assetCounter = new AssetCounter()
			{
				AssetType = assetType,
				AssetSubType = subAssetType,
				Count = count,
				ClientID = ClientID
			};

			var response = client.PostAsJsonAsync("Values", assetCounter).Result;

			if (response.IsSuccessStatusCode)
			{
				return true;
			}
		}
		catch (Exception ex)
		{
			throw ex;
		}

		return false;
	}

	public static bool InvokePostGlobalAsset(GlobalAsset globalAsset)
	{
		if (globalAsset == null)
		{
			return false;
		}

		try
		{
			HttpClient client = new HttpClient();

			client.BaseAddress = new Uri(GetRestServiceBaseAddress());

			client.DefaultRequestHeaders.Accept.Add(
				new MediaTypeWithQualityHeaderValue("application/json"));

			var response = client.PostAsJsonAsync("globalassetsapi", globalAsset).Result;

			if (response.IsSuccessStatusCode)
			{
				return true;
			}
			else
			{
				throw new Exception(response.ReasonPhrase + " : " + response.Content.ReadAsStringAsync().Result);
			}
		}
		catch (Exception ex)
		{
				throw ex;
		}
	}


	public static bool InvokePut(GlobalAsset globalAsset)
	{
		try
		{
			HttpClient client = new HttpClient();

			client.BaseAddress = new Uri(GetRestServiceBaseAddress());

			client.DefaultRequestHeaders.Accept.Add(
				new MediaTypeWithQualityHeaderValue("application/json"));

			var response = client.PutAsJsonAsync("globalassetsapi", globalAsset).Result;

			if (response.IsSuccessStatusCode)
			{
				return true;
			}
		}
		catch (Exception)
		{
		}

		return false;
	}

	private static string GetRestServiceBaseAddress()
	{
		//client.BaseAddress = new Uri("http://globalassetrestservicesample.azurewebsites.net/api/");

		var restServiceBaseAddress = ConfigurationManager.AppSettings["GLOBAL_REST_SERVICE_BASE_ADDRESS"];
		if (string.IsNullOrEmpty(restServiceBaseAddress))
		{
			restServiceBaseAddress = "http://localhost:11964/api/";
		}
		return restServiceBaseAddress;
	}
}