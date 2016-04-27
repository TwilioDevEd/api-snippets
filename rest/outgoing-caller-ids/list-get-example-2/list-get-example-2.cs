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

    var callerIds = twilio.ListOutgoingCallerIds("+14158675309", null, null, null);
    
    foreach (var callerId in callerIds.OutgoingCallerIds)
    {
      Console.WriteLine(callerId.PhoneNumber);
    }
  }
}