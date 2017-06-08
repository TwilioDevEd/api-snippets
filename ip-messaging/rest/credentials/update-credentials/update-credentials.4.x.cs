// Download the twilio-csharp library from twilio.com/docs/csharp/install
using System;
using Twilio.IpMessaging;
using Twilio;

class Example {
    static void Main (string[] args) {
        // Find your Account Sid and Auth Token at twilio.com/user/account
        const string accountSid = "ACXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX";
        const string authToken = "your_auth_token";

        const string credentialSid = "CRXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX";
        const string friendlyName = "friendlyName";
        const string type = "type";
        const string privateKey = "privateKey";
        const string sandbox = "sandbox";
        const string certificate = "certificate";
        const string apiKey = "apiKey";

        // Update a Credential
        var client = new IpMessagingClient(accountSid, authToken);
        Credential credential = client.UpdateCredential(credentialSid,
            type,
            friendlyName,
            certificate,
            privateKey,
            sandbox,
            apiKey);
        Console.WriteLine(credential);
    }
}
