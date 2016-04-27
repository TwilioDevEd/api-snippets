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

    var options = new CallOptions();
    options.Url = "http://demo.twilio.com/docs/voice.xml";
    options.From = "+18668675309";
    options.Method = "GET";
    options.StatusCallback = "https://www.myapp.com/events";
    options.StatusCallbackMethod = "POST";
    options.StatusCallbackEvents = { "initiated", "ringing", "answered", "completed" };

    var call = twilio.InitiateOutboundCall(options);

    Console.WriteLine(call.Sid);
  }
}
