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

    var authorizedApp = twilio.GetAuthorizedConnectApp("CN47260e643654388faabe8aaa18ea6756");

    Console.WriteLine(authorizedApp.HomepageUrl);
  }
}
