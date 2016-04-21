// Download the twilio-csharp library from twilio.com/docs/csharp/install
using System;
using Twilio;
class Example 
{
  static void Main(string[] args) 
  {
    // Find your Account Sid and Auth Token at twilio.com/user/account
    string AccountSid = "AC0132a3c49700934481addd5ce1659f04";
    string AuthToken = "{{ auth_token }}";
    string CurrentAccount = "AC00000000000000000000000000000001";
    var twilio = new TwilioRestClient(AccountSid, AuthToken, CurrentAccount);

    var options = new PhoneNumberOptions();
    options.AccountSid = "AC00000000000000000000000000000002";
    
    twilio.UpdateIncomingPhoneNumber("PN2a0747eba6abf96b7e3c3ff0b4530f6e", options);
  }
}