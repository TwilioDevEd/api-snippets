// Download the twilio-csharp library from twilio.com/docs/libraries/csharp
using System;
using Newtonsoft.Json;
using Twilio;
using Twilio.Rest.Sync.V1.Service;

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
            ShowTimes = new[] { "12:30:00Z", "14:45:00Z", "15:30:00Z", "17:45:00Z", "20:30:00Z" },
            Starring = new[] { "Lance Bass", "Joey Fatone" },
            Genre = "Romance"
        };

        var doc = DocumentResource.Create(serviceSid,
                                          "MyFirstDocument",
                                          JsonConvert.SerializeObject(data));

        Console.WriteLine(doc.Sid);
    }
}
