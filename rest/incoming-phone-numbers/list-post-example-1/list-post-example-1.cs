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
    options.FriendlyName = "My Company Line";
    options.VoiceUrl = "http://demo.twilio.com/docs/voice.xml";
    options.PhoneNumber = "+15105647903";
    options.VoiceMethod = "GET";
    var number = twilio.AddIncomingPhoneNumber(options);
    
    Console.WriteLine(number.Sid);
  }
}