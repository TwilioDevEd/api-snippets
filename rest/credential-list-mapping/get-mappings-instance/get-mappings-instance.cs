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

    var ipAccessControlListMapping = twilio.GetIpAccessControlListMapping("SD32a3c49700934481addd5ce1659f04d2", "AL95a47094615fe05b7c17e62a7877836c");
    
    Console.WriteLine(ipAccessControlListMapping.FriendlyName);
  }
}