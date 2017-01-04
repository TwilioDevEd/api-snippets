// Download the twilio-csharp library from twilio.com/docs/libraries/csharp
using System;
using Twilio;
using Twilio.Rest.Chat.V1.Service;

class Example
{
    static void Main (string[] args)
    {
        // Find your Account SID and Auth Token at twilio.com/console
        const string accountSid = "accountSid";
        const string authToken = "authToken";
        const string serviceSid = "serviceSid";
        const string channelType = "public";

        var client = new TwilioIpMessagingClient(accountSid, authToken);

        TwilioClient.Init(accountSid, authToken);
        // Create a channel
        var channel = ChannelResource.Create(serviceSid, type: ChannelResource.ChannelTypeEnum.Public);

        Console.WriteLine(channel);
    }
}
