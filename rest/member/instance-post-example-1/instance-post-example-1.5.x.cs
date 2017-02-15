// Download the twilio-csharp library from twilio.com/docs/libraries/csharp
using System;
using Twilio;
using Twilio.Rest.Api.V2010.Account.Queue;
using Twilio.Http;
using System.Linq;

class Example
{
    static void Main(string[] args)
    {
        // Find your Account Sid and Auth Token at twilio.com/console
        const string accountSid = "ACXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX";
        const string authToken = "your_auth_token";
        TwilioClient.Init(accountSid, authToken);

        const string queueSid = "QU5ef8732a3c49700934481addd5ce1659";
        const string callSid = "Front";
        var twimlUrl = new Uri("http://demo.twilio.com/docs/voice.xml");

        MemberResource.Update(queueSid,
                              callSid,
                              twimlUrl,
                              HttpMethod.Post);
    }
}
