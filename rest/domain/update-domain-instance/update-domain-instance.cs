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
    var twilio = new TwilioRestClient(AccountSid, AuthToken);

    var options = new DomainOptions();
    options.FriendlyName = "Scranton Office Dev";
    options.VoiceMethod = "GET";

    twilio.UpdateDomain("SD27f0288630a668bdfbf177f8e22f5ccc", options);
  }
}
