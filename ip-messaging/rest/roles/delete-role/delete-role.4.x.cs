// Download the twilio-csharp library from twilio.com/docs/csharp/install
using System;
using Twilio;

class Example {
    static void Main (string[] args) {
        // Find your Account Sid and Auth Token at twilio.com/user/account
        string accountSid = "ACXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX";
        string authToken = "your_auth_token";
        string serviceSid = "ISXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX";
        string roleSid = "RLXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX";
        string type = "deployment";

        // Delete a role
        var client = new TwilioIpMessagingClient(accountSid, authToken);
        DeleteStatus status = client.DeleteStatus(serviceSid, roleSid);
        Console.WriteLine(status);
    }
}
