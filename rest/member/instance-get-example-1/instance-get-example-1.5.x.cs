// Download the twilio-csharp library from twilio.com/docs/libraries/csharp
using System;
using Twilio;
using Twilio.Rest.Api.V2010.Account.Queue;

class Example
{
    static void Main(string[] args)
    {
        // Find your Account Sid and Auth Token at twilio.com/console
        // To set up environmental variables, see http://twil.io/secure
        const string accountSid = Environment.GetEnvironmentVariable("TWILIO_ACCOUNT_SID");
        const string authToken = Environment.GetEnvironmentVariable("TWILIO_AUTH_TOKEN");
        const string queueSid = "QU5ef8732a3c49700934481addd5ce1659";
        const string callSid = "CA386025c9bf5d6052a1d1ea42b4d16662";
        TwilioClient.Init(accountSid, authToken);

        var queueMember = MemberResource.Fetch(queueSid, callSid);

        Console.WriteLine(queueMember.WaitTime);
    }
}
