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

    var options = new CallOptions();
    options.Url = "http://demo.twilio.com/docs/voice.xml";
    options.To = "+15005550003";
    options.From = "+15005550006";
    var call = twilio.InitiateOutboundCall(options);
    
    Console.WriteLine(call.Sid);
  }
}