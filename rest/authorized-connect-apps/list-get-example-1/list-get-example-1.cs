// Download the twilio-csharp library from twilio.com/docs/csharp/install
using System;
using Twilio;
class Example 
{
  static void Main(string[] args) 
  {
    // Find your Account Sid and Auth Token at twilio.com/user/account
    string AccountSid = "AC81e0c32a3c49700934481addd5ce1659";
    string AuthToken = "{{ auth_token }}";
    var twilio = new TwilioRestClient(AccountSid, AuthToken);

    var authorizedApps = twilio.ListAuthorizedConnectApps(null, null);
    
    foreach (var authorizedApp in authorizedApps.AuthorizedConnectApps)
    {
      Console.WriteLine(authorizedApp.ConnectAppHomepageUrl);
    }
  }
}