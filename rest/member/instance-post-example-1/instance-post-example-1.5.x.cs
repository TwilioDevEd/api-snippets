// Download the twilio-csharp library from twilio.com/docs/csharp/install
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
    string accountSid = "ACXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX";
    string authToken = "your_auth_token";
    TwilioClient.Init(accountSid, authToken);

    var queueSid = "QU5ef8732a3c49700934481addd5ce1659";
    var twimlUrl = new Uri("http://demo.twilio.com/docs/voice.xml");

    MemberResource.Update ("QU5ef8732a3c49700934481addd5ce1659",
                           "Front",
                           twimlUrl,
                           HttpMethod.Post);
  }
}
