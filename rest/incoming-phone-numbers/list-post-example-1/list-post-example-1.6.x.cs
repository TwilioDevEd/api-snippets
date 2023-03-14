// Download the twilio-csharp library from twilio.com/docs/libraries/csharp
using System;
using Twilio;
using Twilio.Rest.Api.V2010.Account;
using Twilio.Types;
using Twilio.Http;

class Example
{
    static void Main(string[] args)
    {
        // Find your Account Sid and Auth Token at twilio.com/console
        // To set up environmental variables, see http://twil.io/secure
        const string accountSid = Environment.GetEnvironmentVariable("TWILIO_ACCOUNT_SID");
        const string authToken = Environment.GetEnvironmentVariable("TWILIO_AUTH_TOKEN");
        TwilioClient.Init(accountSid, authToken);

        var number = IncomingPhoneNumberResource.Create(
            friendlyName: "My Company Line",
            voiceUrl: new Uri("http://demo.twilio.com/docs/voice.xml"),
            phoneNumber: new PhoneNumber("+15105647903"),
            voiceMethod: HttpMethod.Get);

        Console.WriteLine(number.Sid);
    }
}
