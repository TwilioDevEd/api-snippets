// Download the twilio-csharp library from twilio.com/docs/csharp/install
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
        const string memberSid = "memberSid";

        TwilioClient.Init(accountSid, authToken);

        // Delete a member
        var status = MemberResource.Delete(serviceSid, channelSid, memberSid);
        Console.WriteLine(status);
    }
}
