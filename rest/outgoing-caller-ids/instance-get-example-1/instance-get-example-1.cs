// Download the twilio-csharp library from twilio.com/docs/csharp/install
using System;
using Twilio;
class Example 
{
  static void Main(string[] args) 
  {
    // Find your Account Sid and Auth Token at twilio.com/user/account
    string AccountSid = "AC228ba32a3c49700934481addd5ce1659";
    string AuthToken = "{{ auth_token }}";
    var twilio = new TwilioRestClient(AccountSid, AuthToken);

    var callerId = twilio.GetOutgoingCallerId("PNe905d7e6b410746a0fb08c57e5a186f3");
    
    Console.WriteLine(callerId.PhoneNumber);
  }
}