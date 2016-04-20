// Download the twilio-csharp library from twilio.com/docs/csharp/install
using System;
using Twilio;
class Example 
{
  static void Main(string[] args) 
  {
    // Find your Account Sid and Auth Token at twilio.com/user/account
    string AccountSid = "AC3094732a3c49700934481addd5ce1659";
    string AuthToken = "{{ auth_token }}";
    var twilio = new TwilioRestClient(AccountSid, AuthToken);

    var options = new PhoneNumberOptions();
    options.VoiceUrl = "http://demo.twilio.com/docs/voice.xml";
    options.PhoneNumber = "+15005550006";
    var number = twilio.AddIncomingPhoneNumber(options);
    
    Console.WriteLine(number.Sid);
  }
}