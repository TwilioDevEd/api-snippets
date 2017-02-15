// Download the twilio-csharp library from twilio.com/docs/libraries/csharp
using System;
using Newtonsoft.Json;
using Twilio;
using Twilio.Rest.Preview.Sync.Service;

public class Example
{
    public static void Main(string[] args)
    {
        // Find your Account SID and Auth Token at twilio.com/console
        const string accountSid = "ACXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX";
        const string authToken = "your_auth_token";
        const string serviceSid = "ISXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX";

        TwilioClient.Init(accountSid, authToken);

        var data = new
        {
            DateUpdated = DateTime.UtcNow,
            MovieTitle = "On The Line",
            ShowTimes = (object)null,
            Starring = new[] { "Lance Bass", "Joey Fatone" },
            Genre = "Romance"
        };

        var doc = DocumentResource.Update(serviceSid,
                                          "MyFirstDocument",
                                          JsonConvert.SerializeObject(data));

        Console.WriteLine(doc.Data);
    }
}
