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

    
    var ipAddress = twilio.CreateIpAddress("AL32a3c49700934481addd5ce1659f04d2", "My office IP Address", "55.102.123.124");
    
    Console.WriteLine(ipAddress.Sid);
  }
}