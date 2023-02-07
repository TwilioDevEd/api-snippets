// Download the twilio-csharp library from twilio.com/docs/libraries/csharp
using System;
using Twilio;
using Twilio.Rest.Wireless.V1;


class Example
{
    static void Main(string[] args)
    {
        // Find your Account SID and Auth Token at twilio.com/console
        // To set up environmental variables, see http://twil.io/secure
        const string accountSid = Environment.GetEnvironmentVariable("TWILIO_ACCOUNT_SID");
        const string authToken = Environment.GetEnvironmentVariable("TWILIO_AUTH_TOKEN");

        TwilioClient.Init(accountSid, authToken);

        var ratePlan = RatePlanResource.Create(
            new CreateRatePlanOptions {
                UniqueName = "SmartMeterCA",
                FriendlyName = "California SmartMeter Plan",
                DataLimit = 5,
                MessagingEnabled = true
            });

        Console.WriteLine(ratePlan.Sid);
    }
}
