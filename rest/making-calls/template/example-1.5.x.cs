// Download the twilio-csharp library from twilio.com/docs/csharp/install
using System;
using Twilio;
using Twilio.Resources.Api.V2010.Account;
using Twilio.Types;
using Twilio.Http;

class Example
{
  static void Main(string[] args)
  {
    string AccountSid = "{{accountSid}}";
    string AuthToken = "{{authToken}}";

    TwilioClient.Init(AccountSid, AuthToken);

    {{#callUrl}}
      {{#toVoiceClient}}
    var callCreator = CallResource.Create(new Client("{{toVoiceClient}}"), new PhoneNumber("from"), new Uri("{{callUrl}}"));
      {{/toVoiceClient}}
      {{#toPhoneNumber}}
    var callCreator = CallResource.Create(new PhoneNumber("{{toPhoneNumber}}"), new PhoneNumber("from"), new Uri("{{callUrl}}"));
      {{/toPhoneNumber}}
    {{/callUrl}}
    {{#applicationSid}}
      {{#toVoiceClient}}
    var callCreator = CallResource.Create(new Client("{{toVoiceClient}}"), new PhoneNumber("from"), "{{applicationSid}}");
      {{/toVoiceClient}}
      {{#toPhoneNumber}}
    var callCreator = CallResource.Create(new PhoneNumber("{{toPhoneNumber}}"), new PhoneNumber("from"), "applicationSid");
      {{/toPhoneNumber}}
    {{/applicationSid}}

    {{#sendDigitsVoice}}callCreator.setSendDigits("{{sendDigitsVoice}}");{{/sendDigitsVoice}}
    {{#callMethod}}callCreator.setMethod(HttpMethod.{{callMethod}});{{/callMethod}}
    {{#callStatusCallback}}callCreator.setStatusCallback("{{callStatusCallback}}");{{/callStatusCallback}}
    {{#callStatusCallbackMethod}}callCreator.setStatusCallbackMethod(HttpMethod.{{callStatusCallbackMethod}});{{/callStatusCallbackMethod}}
    {{#callStatusCallbackEvent}}callCreator.setStatusCallbackEvent = new string[] { {{#callStatusCallbackEvents}}{{.}}{{/callStatusCallbackEvents}} };{{/callStatusCallbackEvent}}

    var call = callCreator.Execute();

    Console.WriteLine(call.sid);
  }
}
