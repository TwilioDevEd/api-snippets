// Install the C# / .NET helper library from twilio.com/docs/csharp/install
using System;
using System.Threading.Tasks;
using System.Collections.Generic;
using System.IO;
using System.Net;
using System.Net.Http;
using System.Text;
using Twilio;
using Newtonsoft.Json;

class Example
{
	static async Task Main(string[] args)
	{
		// Find your Account SID and Auth Token at twilio.com/console
		// and set the environment variables. See http://twil.io/secure
		string accountSid = Environment.GetEnvironmentVariable("TWILIO_ACCOUNT_SID");
		string authToken = Environment.GetEnvironmentVariable("TWILIO_AUTH_TOKEN");

		TwilioClient.Init(accountSid, authToken);

		// Retrieve timed metadata location
		const string recordingSid = "KVXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX";
		const string uri = $"https://media.twilio.com/v1/MediaRecordings/{recordingSid}/TimedMetadata?Ttl=3600";
		var request = (HttpWebRequest)WebRequest.Create(uri);
		request.Headers.Add("Authorization", "Basic " + Convert.ToBase64String(Encoding.ASCII.GetBytes(accountSid + ":" + authToken)));
		request.AllowAutoRedirect = false;
		string responseBody = new StreamReader(request.GetResponse().GetResponseStream()).ReadToEnd();
		var timedMetadataLocation = JsonConvert.DeserializeObject<Dictionary<string, string>>(responseBody)["redirect_to"];
    
		// For example, download the timed metadata to a local file
		var client = new HttpClient();
		var response = await client.GetAsync(timedMetadataLocation);
		using (var stream = await response.Content.ReadAsStreamAsync())
		{
			var fileInfo = new FileInfo("myFile.vtt");
			using (var fileStream = fileInfo.OpenWrite())
			{
				await stream.CopyToAsync(fileStream);
			}
		}
	}
}
