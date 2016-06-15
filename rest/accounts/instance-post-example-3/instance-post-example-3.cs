// Download the twilio-csharp library from twilio.com/docs/csharp/install
using System;
using Twilio;
class Example 
{
  static void Main(string[] args) 
  {
    // Find your Account Sid and Auth Token at twilio.com/user/account
    string AccountSid = "ACXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX";
    string AccountSidToClose = "ACxxxxxxxxxxxxxxxxxxx";
    string AuthToken = "your_auth_token";
    var twilio = new TwilioRestClient(AccountSid, AuthToken);
    Account account = twilio.ChangeSubAccountStatus(AccountSidToClose, Twilio.AccountStatus.Closed);
  }
}