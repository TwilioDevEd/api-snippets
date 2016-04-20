// Download the twilio-csharp library from twilio.com/docs/csharp/install
using System;
using Twilio;
class Example 
{
  static void Main(string[] args) 
  {
    // Find your Account Sid and Auth Token at twilio.com/user/account
    string AccountSid = "AC81e0ca4b0af06b833b6726957613c5d4";
    string AuthToken = "{{ auth_token }}";
    var twilio = new TwilioRestClient(AccountSid, AuthToken);

    var connectApp = twilio.GetConnectApp("CNb989fdd207b04d16aee578018ef5fd93");
    
    Console.WriteLine(connectApp.HomepageUrl);
  }
}