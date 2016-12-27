// Download the twilio-csharp library from twilio.com/docs/csharp/install
using System;
using Twilio;
using Twilio.Rest.Api.V2010.Account.Call;
using System.Collections.Generic;

class Example
{
    static void Main(string[] args)
    {
        // Find your Account Sid and Auth Token at twilio.com/console
        const string accountSid = "ACXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX";
        const string authToken = "your_auth_token";
        TwilioClient.Init(accountSid, authToken);

        var issues = new List<FeedbackResource.IssuesEnum>() {
            FeedbackResource.IssuesEnum.ImperfectAudio
        };
        FeedbackResource.Create("CAe03b7cd806070d1f32bdb7f1046a41c0",
                                3,
                                issue: issues);
    }
}
