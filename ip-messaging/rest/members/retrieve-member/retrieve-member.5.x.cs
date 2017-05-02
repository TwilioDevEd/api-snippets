// Download the twilio-csharp library from twilio.com/docs/libraries/csharp
using System;
using Twilio;
using Twilio.Rest.Chat.V2.Service.Channel;

class Example
{
    static void Main(string[] args)
    {
        // Find your Account SID and Auth Token at twilio.com/console
        const string accountSid = "accountSid";
        const string authToken = "authToken";
        const string serviceSid = "serviceSid";
        const string channelSid = "channelSid";
        const string memberSid = "memberSid";

        TwilioClient.Init(accountSid, authToken);

        // Retrieve the member
        var member = MemberResource.Fetch(serviceSid, channelSid, memberSid);
        
        Console.WriteLine(member.Identity);
    }
}