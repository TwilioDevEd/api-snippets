// Download the twilio-csharp library from twilio.com/docs/csharp/install
using System;
using Twilio;
class Example 
{
  static void Main(string[] args) 
  {
    // Find your Account Sid and Auth Token at twilio.com/user/account
    string AccountSid = "AC1365ff479ef6502d85c27be6467a310c";
    string AuthToken = "{{ auth_token }}";
    var twilio = new TwilioRestClient(AccountSid, AuthToken);

    var account = twilio.GetAccount("AC1365ff479ef6502d85c27be6467a310c");
    
    Console.WriteLine(account.Status);
  }
}