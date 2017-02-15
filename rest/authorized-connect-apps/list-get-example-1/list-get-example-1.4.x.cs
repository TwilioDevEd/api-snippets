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

    var authorizedApps = twilio.ListAuthorizedConnectApps(null, null);

    foreach (var authorizedApp in authorizedApps.AuthorizedConnectApps)
    {
      Console.WriteLine(authorizedApp.HomepageUrl);
    }
  }
}
