// Download the twilio-csharp library from twilio.com/docs/libraries/csharp
using System;
using Twilio;
using Twilio.Rest.Sync.V1.Service.SyncList;

public class Example
{
    public static void Main(string[] args)
    {
        // Find your Account SID and Auth Token at twilio.com/console
        const string accountSid = "ACXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX";
        const string authToken = "your_auth_token";
        const string serviceSid = "ISXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX";

        TwilioClient.Init(accountSid, authToken);

        var items = SyncListItemResource.Read(
            serviceSid,
            "MyCollection",
            from: "10",
            order: SyncListItemResource.QueryResultOrderEnum.Asc);

        foreach (var item in items)
        {
            Console.WriteLine(item.Data);
        }
    }
}
