// Download the twilio-csharp library from twilio.com/docs/libraries/csharp
using System;
using Twilio;
using Twilio.Rest.Chat.V2;

class Example
{
    static void Main (string[] args)
    {
        // Find your Account SID and Auth Token at twilio.com/console
        // To set up environmental variables, see http://twil.io/secure
        const string accountSid = Environment.GetEnvironmentVariable("TWILIO_ACCOUNT_SID");
        const string authToken = Environment.GetEnvironmentVariable("TWILIO_AUTH_TOKEN");
        const string friendlyName = "Friendly Name";
        const string apiKey = "XXX";

        TwilioClient.Init(accountSid, authToken);

        // Create a Credential
        var credential = CredentialResource.Create(CredentialResource.PushServiceEnum.Gcm,
                                                   apiKey: apiKey,
                                                   friendlyName: friendlyName);

        Console.WriteLine(credential.FriendlyName);
    }
}
