// Download the twilio-csharp library from twilio.com/docs/csharp/install
using System;
using Twilio;
using Twilio.Rest.Api.V2010.Account;

class Example
{
    static void Main(string[] args)
    {
        // Find your Account Sid and Auth Token at twilio.com/console
        const string accountSid = "ACXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX";
        const string authToken = "your_auth_token";
        TwilioClient.Init(accountSid, authToken);

        var status = CallResource.StatusEnum.InProgress;
        var startTimeAfter = new DateTime(2009, 07, 04);
        var endTimeBefore = new DateTime(2009, 07, 06);
        var calls = CallResource.Read(status: status,
                                      startTimeAfter: startTimeAfter,
                                      endTimeBefore: endTimeBefore);

        foreach (var call in calls)
        {
            Console.WriteLine(call.To);
        }
    }
}
