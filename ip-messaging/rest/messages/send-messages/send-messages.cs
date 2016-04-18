// Download the twilio-csharp library from twilio.com/docs/csharp/install
using System;
using Twilio;

class Example {
    static void Main (string[] args) {
        // Find your Account Sid and Auth Token at twilio.com/user/account
        string accountSid = "accountSid";
        string authToken = "authToken";
        string credentialSid = "credentialSid";
        string channelSid = "channelSid";
        string memberSid = "memberSid";
        string body = "body";

        // Send a message
        var client = new TwilioIpMessagingClient(accountSid, authToken);
        Message message = client.CreateMessage(serviceSid, channelSid, memberSid, body);
        Console.WriteLine(message);
    }
}