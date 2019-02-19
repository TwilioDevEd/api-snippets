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

    
    
    twilio.UpdateUsageTrigger("UT33c6aeeba34e48f38d6899ea5b765ad4", "Monthly Maximum Call Usage", "https://www.example.com/monthly-usage-trigger", null);
  }
}