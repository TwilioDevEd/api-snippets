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

        var triggers = TriggerResource.Read(
            recurring: TriggerResource.RecurringEnum.Daily,
            usageCategory: TriggerResource.UsageCategoryEnum.Calls);

        foreach (var trigger in triggers)
        {
            Console.WriteLine(trigger.CurrentValue);
        }
    }
}
