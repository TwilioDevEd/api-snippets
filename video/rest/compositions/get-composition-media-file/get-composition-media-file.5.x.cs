// Install the C# / .NET helper library from twilio.com/docs/csharp/install

using System;
using System.Collections.Generic;
using System.IO;
using System.Net;
using System.Text;
using Newtonsoft.Json;

class Example
{
    static void Main(string[] args)
    {
      // Find your API Key SID and Secret at twilio.com/console
      const string apiKeySid = "SKXXXX";
      const string apiKeySecret = "your_api_key_secret";

      const string compositionSid = "CJXXXX";
      const string uri = $"https://video.twilio.com/v1/Compositions/{compositionSid}/Media?Ttl=3600";

      var request = (HttpWebRequest)WebRequest.Create(uri);
      equest.Headers.Add("Authorization", "Basic " + Convert.ToBase64String(Encoding.ASCII.GetBytes(apiKeySid + ":" + apiKeySecret)));
      request.AllowAutoRedirect = false;
      string responseBody = new StreamReader(request.GetResponse().GetResponseStream()).ReadToEnd();
      var mediaLocation = JsonConvert.DeserializeObject<Dictionary<string, string>>(responseBody)["redirect_to"];

      Console.WriteLine(mediaLocation);
      new WebClient().DownloadFile(mediaLocation, $"{compositionSid}.out");
    }
}
