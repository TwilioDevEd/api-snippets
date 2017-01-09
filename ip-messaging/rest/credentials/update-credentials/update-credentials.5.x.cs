// Download the twilio-csharp library from twilio.com/docs/libraries/csharp
using System;
using Twilio;
using Twilio.Rest.Chat.V1;

class Example
{
    static void Main(string[] args)
    {
        // Find your Account SID and Auth Token at twilio.com/console
        const string accountSid = "accountSid";
        const string authToken = "authToken";

        const string credentialSid = "credentialSid";
        const string friendlyName = "friendlyName";
        const string apiKey = "apiKey";

        TwilioClient.Init(accountSid, authToken);

        // Update the credential
        var credential = CredentialResource.Update(credentialSid, friendlyName, apiKey: apiKey);

        Console.WriteLine(credential.FriendlyName);
    }
}
