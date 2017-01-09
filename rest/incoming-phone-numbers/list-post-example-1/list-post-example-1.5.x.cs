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
        const string accountSid = "ACXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX";
        const string authToken = "your_auth_token";
        TwilioClient.Init(accountSid, authToken);

        var number = IncomingPhoneNumberResource.Create(
            friendlyName: "My Company Line",
            voiceUrl: new Uri("http://demo.twilio.com/docs/voice.xml"),
            phoneNumber: new PhoneNumber("+15105647903"),
            voiceMethod: HttpMethod.Get);

        Console.WriteLine(number.Sid);
    }
}
