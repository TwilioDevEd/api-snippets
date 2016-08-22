// Download the twilio-csharp library from twilio.com/docs/csharp/install
using System;
using Twilio;
class Example
{
  static void Main(string[] args)
  {
    // Find your Account Sid and Auth Token at twilio.com/user/account
    string AccountSid = "{{accountSid}}";
    string AuthToken = "{{authToken}}";
    var twilio = new TwilioRestClient(AccountSid, AuthToken);

    var options = new CallOptions();
    {{#fromPhoneNumber}}options.From = "{{fromPhoneNumber}}";{{/fromPhoneNumber}}
    {{#toPhoneNumber}}options.To = "{{toPhoneNumber}}";{{/toPhoneNumber}}
    {{#toVoiceClient}}options.To = "{{toVoiceClient}}";{{/toVoiceClient}}
    {{#callUrl}}options.Url = "{{callUrl}}";{{/callUrl}}
    {{#sendDigitsVoice}}options.SendDigits = "{{sendDigitsVoice}}";{{/sendDigitsVoice}}
    {{#callMethod}}options.Method = "{{callMethod}}";{{/callMethod}}
    {{#callStatusCallback}}options.StatusCallback = "{{callStatusCallback}}";{{/callStatusCallback}}
    {{#callStatusCallbackMethod}}options.StatusCallbackMethod = "{{callStatusCallbackMethod}}";{{/callStatusCallbackMethod}}
    {{#callStatusCallbackEvent}}options.StatusCallbackEvents = new string[] { {{#callStatusCallbackEvents}}{{.}},{{/callStatusCallbackEvents}} };{{/callStatusCallbackEvent}}

    var call = twilio.InitiateOutboundCall(options);

    Console.WriteLine(call.Sid);
  }
}
