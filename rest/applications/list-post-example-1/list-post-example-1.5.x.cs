// Download the twilio-csharp library from twilio.com/docs/libraries/csharp
using System;
using Twilio;
using Twilio.Rest.Api.V2010.Account;
using Twilio.Http;

class Example
{
    static void Main(string[] args)
    {
        // Find your Account Sid and Auth Token at twilio.com/console
        const string accountSid = "ACXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX";
        const string authToken = "your_auth_token";
        TwilioClient.Init(accountSid, authToken);

        var app = ApplicationResource.Create(
            "Phone Me",
            voiceUrl: new Uri("http://demo.twilio.com/docs/voice.xml"),
            voiceMethod: HttpMethod.Get);

        Console.WriteLine(app.Sid);
    }
}
