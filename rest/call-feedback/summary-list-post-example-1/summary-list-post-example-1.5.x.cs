// Download the twilio-csharp library from twilio.com/docs/csharp/install
using System;
using Twilio;
using Twilio.Rest.Api.V2010.Account.Call;

class Example
{
    static void Main(string[] args)
    {
        // Find your Account Sid and Auth Token at twilio.com/console
        const string accountSid = "ACXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX";
        const string authToken = "your_auth_token";
        TwilioClient.Init(accountSid, authToken);

        var summary = FeedbackSummaryResource.Create(new DateTime(2014, 06, 1),
                                                     new DateTime(2014, 06, 30),
                                                     includeSubaccounts: true);
        Console.WriteLine(summary.Status);
    }
}
