// Download the twilio-csharp library from twilio.com/docs/csharp/install
using System;
using Twilio;

class Example {
    static void Main (string[] args) {
        // Find your Account Sid and Auth Token at twilio.com/user/account
        string accountSid = "accountSid";
        string authToken = "authToken";
        string serviceSid = "serviceSid";
        string roleSid = "roleSid";
        string friendlyName = "friendlyName";

        // Update the role
        List<string> permissions = new List<string>();
        permissions.Add("sendMessage");
        permissions.Add("leaveChannel");

        var client = new TwilioIpMessagingClient(accountSid, authToken);
        Role role = client.UpdateRole(serviceSid, roleSid, friendlyName, permissions);
        Console.WriteLine(role);
    }
}