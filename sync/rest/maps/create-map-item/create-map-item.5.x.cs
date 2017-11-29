// Download the twilio-csharp library from twilio.com/docs/libraries/csharp
using System;
using Twilio;
using Twilio.Rest.Sync.V1.Service.SyncMap;

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
            data,
            864000); // expires in 10 days

        Console.WriteLine(item.Data);
    }
}
