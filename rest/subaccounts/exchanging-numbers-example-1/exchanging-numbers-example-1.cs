// Download the twilio-csharp library from twilio.com/docs/csharp/install
using System;
using Twilio;
class Example 
{
  static void Main(string[] args) 
  {
    // Find your Account Sid and Auth Token at twilio.com/user/account
    string AccountSid = "{{ account_sid }}";
    string AuthToken = "{{ auth_token }}";
    string CurrentAccount = "{{ account_sid }}";
    var twilio = new TwilioRestClient(AccountSid, AuthToken, CurrentAccount);

    var options = new PhoneNumberOptions();
    options.AccountSid = "{{ account_sid }}";
    
    twilio.UpdateIncomingPhoneNumber("PN2a0747eba6abf96b7e3c3ff0b4530f6e", options);
  }
}