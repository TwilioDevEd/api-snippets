// Download the twilio-csharp library from twilio.com/docs/csharp/install
using System;
using Twilio;

class Example {
    static void Main (string[] args) {
        // Find your Account Sid and Auth Token at twilio.com/user/account
        const string accountSid = "accountSid";
        const string authToken = "authToken";
        const string serviceSid = "serviceSid";
        const string channelSid = "channelSid";
        const string type = "public";
        const string friendlyName = "friendlyName";
        const string attr = "attributes";
        
        // Update the channel
        var client = new TwilioIpMessagingClient(accountSid, authToken);
        Channel channel = client.UpdateChannel(serviceSid, channelSid, type, friendlyName, attr);
        Console.WriteLine(channel);
    }
}