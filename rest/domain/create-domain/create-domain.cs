// Download the twilio-csharp library from twilio.com/docs/csharp/install
using System;
using Twilio;
class Example 
{
  static void Main(string[] args) 
  {
    // Find your Account Sid and Auth Token at twilio.com/user/account
    string AccountSid = "AC32a3c49700934481addd5ce1659f04d2";
    string AuthToken = "{{ auth_token }}";
    var twilio = new TwilioRestClient(AccountSid, AuthToken);

    var options = new SipDomainOptions();
    options.FriendlyName = "Scranton Office";
    options.VoiceUrl = "https://dundermifflin.example.com/twilio/app.php";
    options.AuthType = "IP_ACL";
    options.DomainName = "dunder-mifflin-scranton.sip.twilio.com";
    var domain = twilio.CreateSipDomain(options);
    
    Console.WriteLine(domain.Sid);
  }
}