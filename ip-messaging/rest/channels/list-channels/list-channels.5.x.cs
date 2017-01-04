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

        TwilioClient.Init(accountSid, authToken);

        //Retrieve the list of channels
        var channels = ChannelResource.Read(serviceSid);
        foreach (var channel in channels)
        {
            Console.WriteLine(channel.FriendlyName);
        }
    }
}
