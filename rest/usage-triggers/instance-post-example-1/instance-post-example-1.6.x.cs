// Download the twilio-csharp library from twilio.com/docs/libraries/csharp
using System;
using Twilio;
using Twilio.Rest.Api.V2010.Account.Usage;

class Example
{
    static void Main(string[] args)
    {
        // Find your Account Sid and Auth Token at twilio.com/console
        // To set up environmental variables, see http://twil.io/secure
        const string accountSid = Environment.GetEnvironmentVariable("TWILIO_ACCOUNT_SID");
        const string authToken = Environment.GetEnvironmentVariable("TWILIO_AUTH_TOKEN");
        TwilioClient.Init(accountSid, authToken);

        TriggerResource.Update(
            "UT33c6aeeba34e48f38d6899ea5b765ad4",
            friendlyName: "Monthly Maximum Call Usage",
            callbackUrl: new Uri("https://www.example.com/monthly-usage-trigger"));
    }
}
