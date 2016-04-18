// Download the twilio-csharp library from twilio.com/docs/csharp/install
using System;
using Twilio;

class Example {
    static void Main (string[] args) {
        // Find your Account Sid and Auth Token at twilio.com/user/account
        const string accountSid = "accountSid";
        const string authToken = "authToken";
        const string type = "type";
        const string friendlyName = "friendlyName";
        const string privateKey = "privateKey";
        const string sandbox = "sandbox";
        const string apikey = "apiKey";
        const string certificate = "certificate";

        // Create a Credential
        var client = new TwilioIpMessagingClient(accountSid, authToken);
        Credential credential = client.CreateCredential (type, friendlyName, certificate, privateKey, sandbox, apikey);
        Console.WriteLine(credential);
    }
}