// Download the twilio-csharp library from twilio.com/docs/libraries/csharp
using System;
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

        var items = SyncMapItemResource.Read(
            serviceSid,
            "Players",
            from: "steph_curry",
            order: SyncMapItemResource.QueryResultOrderEnum.Asc);

        foreach (var item in items)
        {
            Console.WriteLine($"{item.Key} = {item.Data}");
        }
    }
}
