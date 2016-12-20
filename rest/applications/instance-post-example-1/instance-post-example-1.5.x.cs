// Download the twilio-csharp library from twilio.com/docs/csharp/install
using System;
using Twilio;
using Twilio.Rest.Api.V2010.Account;
class Example
{
  static void Main(string[] args)
  {
    // Find your Account Sid and Auth Token at twilio.com/console
    string accountSid = "ACXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX";
    string authToken = "your_auth_token";
    TwilioClient.Init(accountSid, authToken);

    var voiceUrl = new Uri("http://demo.twilio.com/docs/voice.xml");
    var smsUrl = new Uri("http://demo.twilio.com/docs/sms.xml");

    ApplicationResource.Update("AP2a0747eba6abf96b7e3c3ff0b4530f6e",
                               voiceUrl: voiceUrl,
                               smsUrl: smsUrl);
  }
}
