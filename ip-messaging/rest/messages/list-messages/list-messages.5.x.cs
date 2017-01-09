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

        TwilioClient.Init(accountSid, authToken);

        // List all messages
        var messages = MessageResource.Read(serviceSid, channelSid);

        foreach (var message in messages)
        {
            Console.WriteLine(message.DateCreated);
        }
    }
}
