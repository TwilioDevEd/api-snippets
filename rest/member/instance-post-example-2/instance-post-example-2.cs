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

    twilio.DequeueQueueMember("QU5ef8732a3c49700934481addd5ce1659", "CA5ef8732a3c49700934481addd5ce1659", "http://demo.twilio.com/docs/voice.xml", "POST");
  }
}