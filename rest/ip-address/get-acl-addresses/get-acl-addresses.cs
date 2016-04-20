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

    var ipAddresss = twilio.ListIpAddresses("AL32a3c49700934481addd5ce1659f04d2", null, null);
    
    foreach (var ipAddress in ipAddresss.IpAddresses)
    {
      Console.WriteLine(ipAddress.FriendlyName);
    }
  }
}