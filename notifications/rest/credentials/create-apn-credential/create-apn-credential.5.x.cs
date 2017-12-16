// Download the twilio-csharp library from twilio.com/docs/libraries/csharp
using System;
using Twilio;
using Twilio.Rest.Notify.V1;

public class Example
{
    public static void Main(string[] args)
    {
        // Find your Account SID and Auth Token at twilio.com/console
        const string accountSid = "ACXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX";
        const string authToken = "your_auth_token";

        TwilioClient.Init(accountSid, authToken);

        var credential = CredentialResource.Create(
            CredentialResource.PushServiceEnum.Apn,
            "MyAPNCredential",
            "cert.pem_content",
            "key.pem_content",
            true
        );

        Console.WriteLine(credential.FriendlyName);
    }
}
