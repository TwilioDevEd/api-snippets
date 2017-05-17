// Download the twilio-csharp library from twilio.com/docs/libraries/csharp
using System;
using Newtonsoft.Json;
using Twilio;
using Twilio.Rest.Preview.Sync.Service.SyncMap;

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
            Name = "Stephen Curry",
            Level = 30,
            Username = "spicy_curry"
        };

        var item = SyncMapItemResource.Create(
            serviceSid,
            "Players",
            "steph_curry",
            JsonConvert.SerializeObject(data));

        Console.WriteLine(item.Data);
    }
}
