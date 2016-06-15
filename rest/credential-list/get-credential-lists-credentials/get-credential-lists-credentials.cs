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

    var credentials = twilio.ListCredentials("CL32a3c49700934481addd5ce1659f04d2", null, null);
    
    foreach (var credential in credentials.Credentials)
    {
      Console.WriteLine(credential.Username);
    }
  }
}