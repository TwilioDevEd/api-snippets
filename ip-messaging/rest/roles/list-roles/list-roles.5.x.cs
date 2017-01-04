// Download the twilio-csharp library from twilio.com/docs/libraries/csharp
using System;
using Twilio;
using Twilio.Rest.Chat.V1.Service;

class Example
{
    static void Main(string[] args)
    {
        // Find your Account SID and Auth Token at twilio.com/console
        const string accountSid = "accountSid";
        const string authToken = "authToken";
        const string serviceSid = "serviceSid";

        TwilioClient.Init(accountSid, authToken);

        var roles = RoleResource.Read(serviceSid);

        foreach (var role in roles)
        {
            Console.WriteLine(role.FriendlyName);
        }
    }
}
