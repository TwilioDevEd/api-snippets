// Download the twilio-csharp library from twilio.com/docs/libraries/csharp
using System;
using Twilio;
using Twilio.Rest.Chat.V1;

class Example
{
    static void Main (string[] args)
    {
        // Find your Account SID and Auth Token at twilio.com/console
        const string accountSid = "accountSid";
        const string authToken = "authToken";
        const string credentialSid = "credentialSid";

        TwilioClient.Init(accountSid, authToken);

        // Delete a credential
        var status = CredentialResource.Delete(credentialSid);

        Console.WriteLine(status);
    }
}
