// Download the twilio-csharp library from twilio.com/docs/libraries/csharp
using System;
using Twilio;
using Twilio.Rest.Api.V2010.Account;
using Twilio.Types;
using System;

class Example
{
    static void Main(string[] args)
    {
        // Find your Account Sid and Auth Token at twilio.com/console
        // To set up environmental variables, see http://twil.io/secure
        const string accountSid = Environment.GetEnvironmentVariable("TWILIO_ACCOUNT_SID");
        const string authToken = Environment.GetEnvironmentVariable("TWILIO_AUTH_TOKEN");
        TwilioClient.Init(accountSid, authToken);

        var call = CallResource.Create(
            new PhoneNumber("+1562300000"),
            new PhoneNumber("+18180000000"),
            machineDetection: "Enable",
            url: new Uri("https://handler.twilio.com/twiml/EH8ccdbd7f0b8fe34357da8ce87ebe5a16")
        );

        Console.WriteLine(call.To);
    }
}
