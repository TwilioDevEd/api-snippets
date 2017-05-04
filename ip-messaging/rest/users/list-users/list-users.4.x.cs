// Download the twilio-csharp library from twilio.com/docs/csharp/install
using System;
using Twilio;

class Example {
    static void Main (string[] args) {
        // Find your Account Sid and Auth Token at twilio.com/user/account
        const string accountSid = "ACXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX";
        const string authToken = "your_auth_token";
        const string serviceSid = "ISXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX";

        // List users
        var client = new TwilioIpMessagingClient(accountSid, authToken);
        UserResult result = client.ListUsers(serviceSid);

        Console.WriteLine(result);
    }
}