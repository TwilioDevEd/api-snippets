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
        const string messageSid = "IMXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX";

        // Update Message
        var client = new IpMessagingClient(accountSid, authToken);
        var newBody = "New text for the message.";
        var message = client.UpdateMessage(serviceSid, channelSid, messageSid, newBody);
        Console.WriteLine(message);
    }
}
