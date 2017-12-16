// Download the twilio-csharp library from twilio.com/docs/libraries/csharp
using System;
using Twilio;
using Twilio.Rest.Chat.V2;

class Example
{
    static void Main(string[] args)
    {
        // Find your Account SID and Auth Token at twilio.com/console
        const string accountSid = "ACXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX";
        const string authToken = "your_auth_token";

        const string credentialSid = "CRXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX";
        const string friendlyName = "friendlyName";
        const string apiKey = "apiKey";

        TwilioClient.Init(accountSid, authToken);

        // Update the credential
        var credential = CredentialResource.Update(credentialSid, friendlyName, apiKey: apiKey);

        Console.WriteLine(credential.FriendlyName);
    }
}
