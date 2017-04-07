// Download the twilio-csharp library from twilio.com/docs/csharp/install
using System;
using Twilio;

class Example {
    static void Main (string[] args) {
        // Find your Account Sid and Auth Token at twilio.com/user/account
        const string accountSid = "accountSid";
        const string authToken = "authToken";

        // List all Credentials
        var client = new TwilioIpMessagingClient(accountSid, authToken);
        CredentialResult result = client.ListCredentials();
        Console.WriteLine(result);
    }
}