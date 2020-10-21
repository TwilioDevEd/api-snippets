// Download the twilio-csharp library from twilio.com/docs/libraries/csharp
using System;
using Twilio;
using Twilio.Rest.Api.V2010.Account.Call;
using System.Collections.Generic;

class Example
{
    static void Main(string[] args)
    {
        // Find your Account Sid and Auth Token at twilio.com/console
        // To set up environmental variables, see http://twil.io/secure
        const string accountSid = Environment.GetEnvironmentVariable("TWILIO_ACCOUNT_SID");
        const string authToken = Environment.GetEnvironmentVariable("TWILIO_AUTH_TOKEN");
        TwilioClient.Init(accountSid, authToken);

        var issues = new List<FeedbackResource.IssuesEnum>() {
            FeedbackResource.IssuesEnum.ImperfectAudio
        };
        FeedbackResource.Create("CAe03b7cd806070d1f32bdb7f1046a41c0",
                                qualityScore: 3,
                                issue: issues);
    }
}
