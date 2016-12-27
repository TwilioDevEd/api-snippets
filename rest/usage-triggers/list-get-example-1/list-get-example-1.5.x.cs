// Download the twilio-csharp library from twilio.com/docs/csharp/install
using System;
using Twilio;
using Twilio.Rest.Api.V2010.Account.Usage;

class Example
{
    static void Main(string[] args)
    {
        // Find your Account Sid and Auth Token at twilio.com/console
        const string accountSid = "ACXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX";
        const string authToken = "your_auth_token";
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
