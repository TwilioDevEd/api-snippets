
// Download the twilio-csharp library from twilio.com/docs/libraries/csharp
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
        // Find your Account SID and Auth Token at twilio.com/console
        // To set up environmental variables, see http://twil.io/secure
        const string apiKeySid = Environment.GetEnvironmentVariable("TWILIO_API_KEY_SID");
        const string apiKeySecret = Environment.GetEnvironmentVariable("TWILIO_API_KEY_SECRET");

        const string roomSid = "RMXXXXXXXXXXXXXXXXXXXXXXXXXXXXX";
        const string recordingSid = "RTXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX";
        const string uri = "https://video.twilio.com/v1/" +
                          $"Rooms/{roomSid}/" +
                          $"Recordings/{recordingSid}/" +
                           "Media/";

        var request = (HttpWebRequest)WebRequest.Create(uri);
        request.Headers.Add("Authorization", "Basic " + Convert.ToBase64String(Encoding.ASCII.GetBytes(apiKeySid + ":" + apiKeySecret)));
        request.AllowAutoRedirect = false;
        string responseBody = new StreamReader(request.GetResponse().GetResponseStream()).ReadToEnd();
        var mediaLocation = JsonConvert.DeserializeObject<Dictionary<string, string>>(responseBody)["redirect_to"];

        Console.WriteLine(mediaLocation);
        new WebClient().DownloadFile(mediaLocation, $"{recordingSid}.out");
    }
}
