// Download the twilio-csharp library from twilio.com/docs/libraries/csharp
using System;
using Twilio;
using Twilio.Rest.Pricing.V2.Voice;
using Twilio.Types;

public class Example
{
    public static void Main(string[] args)
    {
        // Find your Account SID and Auth Token at twilio.com/console
        // To set up environmental variables, see http://twil.io/secure
        const string accountSid = Environment.GetEnvironmentVariable("TWILIO_ACCOUNT_SID");
        const string authToken = Environment.GetEnvironmentVariable("TWILIO_AUTH_TOKEN");

        TwilioClient.Init(accountSid, authToken);

        var number = NumberResource.Fetch(
            new PhoneNumber("+15108675310"),
            originationNumber: new PhoneNumber('+12421234567')
        );

        Console.WriteLine(number.outboundCallPrices.CurrentPrice);
    }
}
