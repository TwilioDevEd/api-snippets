// Download the twilio-csharp library from twilio.com/docs/csharp/install
using System;
using Twilio;

class Example {
    static void Main (string[] args) {
        // Find your Account Sid and Auth Token at twilio.com/user/account
        string accountSid = "accountSid";
        string authToken = "authToken";
        string serviceSid = "serviceSid";

        // Retrieve the list of roles
        var client = new TwilioIpMessagingClient(accountSid, authToken);
        RoleResult roles = client.ListRoles(serviceSid);
        Console.WriteLine(roles);
    }
}