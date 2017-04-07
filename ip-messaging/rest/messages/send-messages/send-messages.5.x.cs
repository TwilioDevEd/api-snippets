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
        const string body = "body";

        TwilioClient.Init(accountSid, authToken);

        // Send a message
        var message = MessageResource.Create(serviceSid, channelSid, body);
        Console.WriteLine(message.From);
    }
}
