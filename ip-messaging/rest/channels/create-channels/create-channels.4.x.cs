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
        const string channelType = "public";
        const string friendlyName = "MyChannel";
        const string uniqueName = "my-channel";
        const string attributes = "";

        // Create a channel
        var client = new IpMessagingClient(accountSid, authToken);
        Channel channel = client.CreateChannel(serviceSid,
            channelType,
            friendlyName,
            uniqueName,
            attributes);
        Console.WriteLine(channel);
    }
}
