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
        const string messageSid = "messageSid";

        // Retrieve Message
        var client = new IpMessagingClient(accountSid, authToken);
        Message message = client.GetMessage(serviceSid, channelSid, messageSid);
        Console.WriteLine(message);
    }
}