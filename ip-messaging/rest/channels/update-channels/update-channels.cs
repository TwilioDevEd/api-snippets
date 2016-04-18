// Download the twilio-csharp library from twilio.com/docs/csharp/install
using System;
using Twilio;

class Example {
    static void Main (string[] args) {
        // Find your Account Sid and Auth Token at twilio.com/user/account
        string accountSid = "accountSid";
        string authToken = "authToken";
        string serviceSid = "serviceSid";
        string channelSid = "channelSid";
        string type = "public";
        string friendlyName = "friendlyName";
        string attr = "attributes";
        
        // Update the channel
        var client = new TwilioIpMessagingClient(accountSid, authToken);
        Channel channel = client.UpdateChannel(serviceSid, channelSid, type, friendlyName, attr);
        Console.WriteLine(channel);
    }
}
