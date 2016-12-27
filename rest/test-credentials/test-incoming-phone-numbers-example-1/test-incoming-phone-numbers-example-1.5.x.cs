// Download the twilio-csharp library from twilio.com/docs/csharp/install
using System;
using Twilio;
using Twilio.Rest.Api.V2010.Account;
using Twilio.Types;

class Example
{
    static void Main(string[] args)
    {
        // Find your Account Sid and Auth Token at twilio.com/console
        const string accountSid = "ACXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX";
        const string authToken = "your_auth_token";
        TwilioClient.Init(accountSid, authToken);

        var voiceUrl = new Uri("http://demo.twilio.com/docs/voice.xml");
        var phoneNumber = new PhoneNumber("+15005550006");
        var number = IncomingPhoneNumberResource.Create(phoneNumber: phoneNumber,
                                                        voiceUrl: voiceUrl);

        Console.WriteLine(number.Sid);
    }
}
