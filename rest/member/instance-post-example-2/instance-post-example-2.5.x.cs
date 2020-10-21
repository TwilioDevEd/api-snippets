// Download the twilio-csharp library from twilio.com/docs/libraries/csharp
using System;
using Twilio;
using Twilio.Rest.Api.V2010.Account.Queue;
using Twilio.Http;

class Example
{
    static void Main(string[] args)
    {
        // Find your Account Sid and Auth Token at twilio.com/console
        // To set up environmental variables, see http://twil.io/secure
        const string accountSid = Environment.GetEnvironmentVariable("TWILIO_ACCOUNT_SID");
        const string authToken = Environment.GetEnvironmentVariable("TWILIO_AUTH_TOKEN");
        TwilioClient.Init(accountSid, authToken);

        const string queueSid = "QU5ef8732a3c49700934481addd5ce1659";
        const string callSid = "CA5ef8732a3c49700934481addd5ce1659";
        var twimlUrl = new Uri("http://demo.twilio.com/docs/voice.xml");
        MemberResource.Update(queueSid,
                              callSid,
                              twimlUrl,
                              HttpMethod.Post);
    }
}
