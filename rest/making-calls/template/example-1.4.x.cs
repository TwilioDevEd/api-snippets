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
    {{#applicationSid}}options.ApplicationSid = "{{applicationSid}}";{{/applicationSid}}
    {{#sendDigitsVoice}}options.SendDigits = "{{sendDigitsVoice}}";{{/sendDigitsVoice}}
    {{#callMethod}}options.Method = "{{callMethod}}";{{/callMethod}}
    {{#callStatusCallback}}options.StatusCallback = "{{callStatusCallback}}";{{/callStatusCallback}}
    {{#callStatusCallbackMethod}}options.StatusCallbackMethod = "{{callStatusCallbackMethod}}";{{/callStatusCallbackMethod}}
    {{#callStatusCallbackEvent}}options.StatusCallbackEvents = new string[] { {{#callStatusCallbackEvents}}{{.}},{{/callStatusCallbackEvents}} };{{/callStatusCallbackEvent}}
    {{#callFallbackUrl}}options.FallbackUrl = "{{callFallbackUrl}}";{{/callFallbackUrl}}
    {{#callFallbackMethod}}options.FallbackMethod = "{{callFallbackMethod}}";{{/callFallbackMethod}}
    {{#callIfMachine}}options.IfMachine = "{{callIfMachine}}";{{/callIfMachine}}
    {{#callTimeout}}options.Timeout = {{callTimeout}};{{/callTimeout}}
    {{#callRecord}}options.Record = {{callRecord}};{{/callRecord}}
    {{#callRecordingChannels}}options.RecordingChannels = "{{callRecordingChannels}}";{{/callRecordingChannels}}
    {{#callRecordingStatusCallback}}options.RecordingStatusCallback = "{{callRecordingStatusCallback}}";{{/callRecordingStatusCallback}}
    {{#callRecordingStatusCallbackMethod}}options.RecordingStatusCallbackMethod = "{{callRecordingStatusCallbackMethod}}";{{/callRecordingStatusCallbackMethod}}
    {{#callSipAuthUsername}}options.SipAuthUsername = "{{callSipAuthUsername}}";{{/callSipAuthUsername}}
    {{#callSipAuthPassword}}options.SipAuthPassword = "{{callSipAuthPassword}}";{{/callSipAuthPassword}}

    var call = twilio.InitiateOutboundCall(options);

    Console.WriteLine(call.Sid);
  }
}
