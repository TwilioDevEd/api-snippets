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
        const string apikey = "apiKey";
        const string friendlyName = "Friendly Name";

        TwilioClient.Init(accountSid, authToken);

        // Create a Credential
        var credential = CredentialResource.Create(CredentialResource.PushServiceEnum.Gcm,
                                                   apiKey: apiKey,
                                                   friendlyName: friendlyName);

        Console.WriteLine(credential.FriendlyName);
    }
}
