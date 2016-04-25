// Download the twilio-csharp library from twilio.com/docs/csharp/install
using System;
using Twilio;
class Example 
{
  static void Main(string[] args) 
  {
    // Find your Account Sid and Auth Token at twilio.com/user/account
    string AccountSid = "ACdc5f132a3c49700934481addd5ce1659";
    string AuthToken = "{{ auth_token }}";
    var twilio = new TwilioRestClient(AccountSid, AuthToken);
 
    twilio.UpdateShortCode("SC6b20cb705c1e8f00210049b20b70fce3", null, null, "http://demo.twilio.com/docs/sms.xml", null, null, null);
  }
}