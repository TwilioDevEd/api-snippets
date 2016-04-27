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
    var twilio = new TwilioRestClient(AccountSid, AuthToken);

    var options = new AddressOptions();
    options.CustomerName = "Customer 456";
    options.Street = "2 Hasselhoff Lane";

    twilio.UpdateAddress("AD2a0747eba6abf96b7e3c3ff0b4530f6e", options);
  }
}
