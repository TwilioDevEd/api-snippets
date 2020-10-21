// Download the twilio-csharp library from twilio.com/docs/libraries/csharp
using System;
using Twilio;
using Twilio.Rest.Api.V2010.Account;

class Example
{
    static void Main(string[] args)
    {
        // Find your Account Sid and Auth Token at twilio.com/console
        // To set up environmental variables, see http://twil.io/secure
        const string accountSid = Environment.GetEnvironmentVariable("TWILIO_ACCOUNT_SID");
        const string authToken = Environment.GetEnvironmentVariable("TWILIO_AUTH_TOKEN");
        TwilioClient.Init(accountSid, authToken);

        ApplicationResource.Update(
            "AP2a0747eba6abf96b7e3c3ff0b4530f6e",
            voiceUrl: new Uri("http://demo.twilio.com/docs/voice.xml"),
            smsUrl: new Uri("http://demo.twilio.com/docs/sms.xml"));
    }
}
