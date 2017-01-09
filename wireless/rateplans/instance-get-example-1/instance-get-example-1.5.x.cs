// Download the twilio-csharp library from twilio.com/docs/libraries/csharp
using System;
using Twilio;
using Twilio.Rest.Preview.Wireless;

public class Example
{
    public static void Main(string[] args)
    {
        // Find your Account SID and Auth Token at twilio.com/console
        const string accountSid = "ACXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX";
        const string authToken = "your_auth_token";
        const string ratePlanSid = "WP467fb57a0aba9641a8209136d42545f8";

        TwilioClient.Init(accountSid, authToken);

        var ratePlan = RatePlanResource.Fetch(ratePlanSid);

        Console.WriteLine(ratePlan.Sid);
        Console.WriteLine(ratePlan.Alias);
    }
}
