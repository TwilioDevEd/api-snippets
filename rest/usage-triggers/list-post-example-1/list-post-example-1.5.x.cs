// Download the twilio-csharp library from twilio.com/docs/libraries/csharp
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

        var callbackUrl = new Uri("http://www.example.com/");
        const string triggerValue = "1000";
        var trigger = TriggerResource.Create(callbackUrl,
                                             triggerValue,
                                             TriggerResource.UsageCategoryEnum.Sms);

        Console.WriteLine(trigger.Sid);
    }
}
