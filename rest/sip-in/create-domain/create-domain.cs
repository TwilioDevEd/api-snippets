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

    var options = new DomainOptions();
    options.FriendlyName = "My Domain";
    options.VoiceUrl = "https://demo.twilio.com/welcome";
    options.AuthType = "IP_ACL";
    options.DomainName = "marlo.sip.twilio.com";
    var domain = twilio.CreateDomain(options);

    Console.WriteLine(domain.Sid);
  }
}