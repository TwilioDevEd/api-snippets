// Download the twilio-csharp library from twilio.com/docs/csharp/install
using System;
using Twilio;
class Example 
{
  static void Main(string[] args) 
  {
    // Find your Account Sid and Auth Token at twilio.com/user/account
    string AccountSid = "ACXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX";
    string AuthToken = "{{ auth_token }}";
    string CurrentAccount = "ACXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX";
    var twilio = new TwilioRestClient(AccountSid, AuthToken, CurrentAccount);

    var options = new PhoneNumberOptions();
    options.AccountSid = "ACXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX";
    
    twilio.UpdateIncomingPhoneNumber("PN2a0747eba6abf96b7e3c3ff0b4530f6e", options);
  }
}