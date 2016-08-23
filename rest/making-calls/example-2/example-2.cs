// Download the twilio-csharp library from twilio.com/docs/csharp/install
using System;
using Twilio;
class Example 
{
  static void Main(string[] args) 
  {
    // Find your Account Sid and Auth Token at twilio.com/user/account
    string AccountSid = "{{#accountSid}}{{accountSid}}{{/accountSid}}";
    string AuthToken = "{{#authToken}}{{authToken}}{{/authToken}}";
    var twilio = new TwilioRestClient(AccountSid, AuthToken);

    var options = new CallOptions();
    options.Url = "{{#voiceCallUrl}}{{voiceCallUrl}}{{/voiceCallUrl}}";
    options.To = "{{#voiceCallClient}}{{voiceCallClient}}{{/voiceCallClient}}";
    options.From = "{{#fromPhoneNumber}}{{fromPhoneNumber}}{{/fromPhoneNumber}}";
    var call = twilio.InitiateOutboundCall(options);
    
    Console.WriteLine(call.Sid);
  }
}