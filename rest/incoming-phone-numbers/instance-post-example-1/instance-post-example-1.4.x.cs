// Download the twilio-csharp library from twilio.com/docs/csharp/install
using System;
using Twilio;
class Example 
{
  static void Main(string[] args) 
  {
    // Find your Account Sid and Auth Token at twilio.com/user/account
    string AccountSid = "ACXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX";
    string AuthToken = "your_auth_token";
    var twilio = new TwilioRestClient(AccountSid, AuthToken);

    var options = new PhoneNumberOptions();
    options.VoiceUrl = "http://demo.twilio.com/docs/voice.xml";
    options.SmsUrl = "http://demo.twilio.com/docs/sms.xml";
    
    twilio.UpdateIncomingPhoneNumber("PN2a0747eba6abf96b7e3c3ff0b4530f6e", options);
  }
}