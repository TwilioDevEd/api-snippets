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

    var options = new DomainOptions();
    options.FriendlyName = "Scranton Office";
    options.VoiceUrl = "https://dundermifflin.example.com/twilio/app.php";
    options.AuthType = "IP_ACL";
    options.DomainName = "dunder-mifflin-scranton.sip.twilio.com";
    var domain = twilio.CreateDomain(options);

    Console.WriteLine(domain.Sid);
  }
}
