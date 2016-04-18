// Download the twilio-csharp library from twilio.com/docs/csharp/install
using System;
using Twilio;

class Example {
    static void Main (string[] args) {
        // Find your Account Sid and Auth Token at twilio.com/user/account
        const string accountSid = "accountSid";
        const string authToken = "authToken";
        const string serviceSid = "serviceSid";
        const string type = "deployment";
        const string friendlyName = "roleName"

        // Create a role
        List<string> permissions = new List<string>();
        permissions.Add("createChannel");
        permissions.Add("joinChannel");

        var client = new TwilioIpMessagingClient(accountSid, authToken);
        Role role = client.CreateRole(serviceSid, friendlyName, type, permissions);
        Console.WriteLine(role);
    }
}