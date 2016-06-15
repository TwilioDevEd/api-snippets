// Download the twilio-csharp library from twilio.com/docs/csharp/install
using System;
using Twilio;
using System.Collections.Generic;

class Example
{
  static void Main(string[] args)
  {
    // Find your Account Sid and Auth Token at twilio.com/user/account
    string AccountSid = "ACXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX";
    string AuthToken = "your_auth_token";
    var twilio = new TwilioRestClient(AccountSid, AuthToken);

    twilio.CreateFeedback("CAe03b7cd806070d1f32bdb7f1046a41c0", 3, new List<string>() { "imperfect-audio" });
  }
}
