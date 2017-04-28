// Download the twilio-csharp library from twilio.com/docs/libraries/csharp
using System;
using Twilio;
using Twilio.Rest.Chat.V2;

class Example
{
    static void Main(string[] args)
    {
        // Find your Account SID and Auth Token at twilio.com/console
        const string accountSid = "accountSid";
        const string authToken = "authToken";

        TwilioClient.Init(accountSid, authToken);

        var services = ServiceResource.Read();

        foreach (var service in services)
        {
            Console.WriteLine(service.FriendlyName);
        }
    }
}
