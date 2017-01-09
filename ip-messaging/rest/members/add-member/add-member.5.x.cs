// Download the twilio-csharp library from twilio.com/docs/libraries/csharp
using System;
using Twilio;
using Twilio.Rest.Chat.V1.Service.Channel;

class Example
{
    static void Main(string[] args)
    {
        // Find your Account SID and Auth Token at twilio.com/console
        const string accountSid = "accountSid";
        const string authToken = "authToken";
        const string serviceSid = "serviceSid";
        const string channelSid = "channelSid";
        const string identity = "identity";

        TwilioClient.Init(accountSid, authToken);

        // Add a member
        var member = MemberResource.Create(serviceSid, channelSid, identity);

        Console.WriteLine(member);
    }
}
