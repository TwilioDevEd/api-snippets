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

    var queueMember = twilio.GetQueueMember("QU5ef8732a3c49700934481addd5ce1659", "CA386025c9bf5d6052a1d1ea42b4d16662");
    
    Console.WriteLine(queueMember.WaitTime);
  }
}