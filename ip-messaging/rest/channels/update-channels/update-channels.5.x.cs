// Download the twilio-csharp library from twilio.com/docs/libraries/csharp
using System;
using Twilio;
using Twilio.Rest.Chat.V2.Service;

class Example
{
    static void Main (string[] args)
    {
        // Find your Account SID and Auth Token at twilio.com/console
        const string accountSid = "ACXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX";
        const string authToken = "your_auth_token";
        const string serviceSid = "ISXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX";
        const string channelSid = "CHXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX";
        const string friendlyName = "friendlyName";

        TwilioClient.Init(accountSid, authToken);

        // Update the channel
        var channel = ChannelResource.Update(serviceSid,
                                             channelSid,
                                             friendlyName: friendlyName);

        Console.WriteLine(channel.FriendlyName);
    }
}
