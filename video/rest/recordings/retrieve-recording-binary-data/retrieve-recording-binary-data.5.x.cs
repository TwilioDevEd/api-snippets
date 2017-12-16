// Download the twilio-csharp library from twilio.com/docs/libraries/csharp
using System;
using System.Collections.Generic;
using System.Net;
using Newtonsoft.Json;
using Twilio;
using Twilio.Http;

class Example
{
    static void Main(string[] args)
    {
        // Find your Account SID and Auth Token at twilio.com/console
        const string apiKeySid = "SKXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX";
        const string apiKeySecret = "your_api_key_secret";
        TwilioClient.Init(apiKeySid, apiKeySecret);

        const string recordingSid = "RTXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX";
        var uri = $"https://video.twilio.com/v1/Recordings/{recordingSid}/Media";
        var response = TwilioClient.GetRestClient().Request(new Request(HttpMethod.Get, uri));
        var mediaLocation =
            JsonConvert.DeserializeObject<Dictionary<string, string>>(response.Content)["location"];

        using (var webClient = new WebClient())
        {
            string mediaContent = webClient.DownloadString(mediaLocation);
            Console.WriteLine(mediaContent);
        }
    }
}
