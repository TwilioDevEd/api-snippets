// Download the twilio-csharp library from twilio.com/docs/csharp/install
using System;
using Twilio.IpMessaging;
using Twilio.IpMessaging.Model;

class Example {
    static void Main (string[] args) {
        // Find your Account Sid and Auth Token at twilio.com/user/account
        const string accountSid = "ACXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX";
        const string authToken = "your_auth_token";
        const string serviceSid = "ISXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX";
        const string channelSid = "CHXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX";
        const string type = "public";
        const string friendlyName = "friendlyName";
        const string attr = "attributes";
        
        // Update the channel
        var client = new IpMessagingClient(accountSid, authToken);
        Channel channel = client.UpdateChannel(serviceSid, channelSid, type, friendlyName, attr);
        Console.WriteLine(channel);
    }
}