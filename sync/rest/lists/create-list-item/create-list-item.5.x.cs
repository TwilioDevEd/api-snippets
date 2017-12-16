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

        var data = new
        {
            Number = "001",
            Name = "Bulbasaur",
            Attack = 49
        };

        var item = SyncListItemResource.Create(serviceSid,
                                               "MyCollection",
                                               data,
                                               864000); // expires in 10 days

        Console.WriteLine(item.Index);
    }
}
