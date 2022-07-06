// Install the C# / .NET helper library from twilio.com/docs/csharp/install

using System;
using System.Collections.Generic;
using System.IO;
using System.Net;
using System.Text;
using Twilio;
using Newtonsoft.Json;

class Example
{
    static void Main(string[] args)
    {
      // Find your Account SID and Auth Token at twilio.com/console
      // and set the environment variables. See http://twil.io/secure
      string accountSid = Environment.GetEnvironmentVariable("TWILIO_ACCOUNT_SID");
      string authToken = Environment.GetEnvironmentVariable("TWILIO_AUTH_TOKEN");

      TwilioClient.Init(accountSid, authToken);

      const string compositionSid = "CJXXXX";
      const string uri = $"https://video.twilio.com/v1/Compositions/{compositionSid}/Media?Ttl=3600";

      var request = (HttpWebRequest)WebRequest.Create(uri);
      request.Headers.Add("Authorization", "Basic " + Convert.ToBase64String(Encoding.ASCII.GetBytes(apiKeySid + ":" + apiKeySecret)));
      request.AllowAutoRedirect = false;
      string responseBody = new StreamReader(request.GetResponse().GetResponseStream()).ReadToEnd();
      var mediaLocation = JsonConvert.DeserializeObject<Dictionary<string, string>>(responseBody)["redirect_to"];

      Console.WriteLine(mediaLocation);
      new WebClient().DownloadFile(mediaLocation, $"{compositionSid}.out");
    }
}
