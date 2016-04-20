// Download the twilio-csharp library from twilio.com/docs/csharp/install
using System;
using Twilio;
class Example 
{
  static void Main(string[] args) 
  {
    // Find your Account Sid and Auth Token at twilio.com/user/account
    string AccountSid = "ACba8bc05eacf94afdae398e642c9cc32d";
    string AuthToken = "{{ auth_token }}";
    var twilio = new TwilioRestClient(AccountSid, AuthToken);

    var feedback = twilio.GetFeedback("CAbb9fe897bc46347cddd23ba42c94bdac");
    
    Console.WriteLine(feedback.DateCreated);
  }
}
