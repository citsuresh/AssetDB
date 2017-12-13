using System;
using System.Collections.Generic;
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
			client.BaseAddress = new Uri("http://localhost:11964/api/");

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

	public static async void PostAsync(int assetType, int subAssetType, int count = 1)
	{
		try
		{
			HttpClient client = new HttpClient();
			client.BaseAddress = new Uri("http://localhost:11964/api/");

			client.DefaultRequestHeaders.Accept.Add(
				new MediaTypeWithQualityHeaderValue("application/json"));

			var assetCounter = new AssetCounter()
			{
				AssetType = assetType,
				AssetSubType = subAssetType,
				Count = count
			};

			var response = client.PostAsJsonAsync("Values", assetCounter);
		}
		catch (Exception)
		{
		}
	}

	public static void InvokePost(int assetType, int subAssetType, int count = 1)
	{
		try
		{
			HttpClient client = new HttpClient();
			client.BaseAddress = new Uri("http://localhost:11964/api/");

			client.DefaultRequestHeaders.Accept.Add(
				new MediaTypeWithQualityHeaderValue("application/json"));

			var assetCounter = new AssetCounter()
			{
				AssetType = assetType,
				AssetSubType = subAssetType,
				Count = count
			};

			var response = client.PostAsJsonAsync("Values", assetCounter).Result;

			if (response.IsSuccessStatusCode)
			{
			}
		}
		catch (Exception)
		{
		}
	}
}