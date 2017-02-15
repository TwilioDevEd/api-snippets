// Download the twilio-csharp library from twilio.com/docs/csharp/install
using System;
using Twilio.IpMessaging;

class Example {
    static void Main (string[] args) {
        // Find your Account Sid and Auth Token at twilio.com/user/account
        const string accountSid = "accountSid";
        const string authToken = "authToken";
        const string serviceSid = "serviceSid";
        const string channelSid = "channelSid";

        // List all Messages
        var client = new IpMessagingClient(accountSid, authToken);
        MessageResult result = client.ListMessages(serviceSid, channelSid);

        Console.WriteLine(result);
    }
}