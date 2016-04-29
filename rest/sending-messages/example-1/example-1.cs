// Download the twilio-csharp library from twilio.com/docs/csharp/install
using System;
using Twilio;
class Example 
{
  static void Main(string[] args) 
  {
    // Find your Account Sid and Auth Token at twilio.com/user/account
    string AccountSid = "ACXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX";
    string AuthToken = "{{ auth_token }}";
    var twilio = new TwilioRestClient(AccountSid, AuthToken);

    
    var message = twilio.SendMessage("+14158141829", "+15558675309", "Jenny please?! I love you <3", new string[] {"http://www.example.com/hearts.png"});
    
    Console.WriteLine(message.Sid);
  }
}