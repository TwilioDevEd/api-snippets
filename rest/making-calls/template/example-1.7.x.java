// Install the Java helper library from twilio.com/docs/java/install
{{#callUrl}}
import java.net.URI;
import java.net.URISyntaxException;
{{/callUrl}}
{{#callStatusCallbackEvent}}import java.util.Arrays;{{/callStatusCallbackEvent}}

import com.twilio.Twilio;
{{#callMethod}}import com.twilio.http.HttpMethod;{{/callMethod}}
{{#callStatusCallbackMethod}}import com.twilio.http.HttpMethod;{{/callStatusCallbackMethod}}
{{#callRecordingStatusCallbackMethod}}import com.twilio.http.HttpMethod;{{/callRecordingStatusCallbackMethod}}
{{#callFallbackMethod}}import com.twilio.http.HttpMethod;{{/callFallbackMethod}}
import com.twilio.rest.api.v2010.account.Call;
import com.twilio.rest.api.v2010.account.CallCreator;
{{#toVoiceClient}}import com.twilio.type.Client;{{/toVoiceClient}}
import com.twilio.type.PhoneNumber;

public class Example {
  // Find your Account Sid and Token at twilio.com/user/account
  public static final String ACCOUNT_SID = "{{accountSid}}";
  public static final String AUTH_TOKEN = "{{authToken}}";

  public static void main(String[] args){{#callUrl}} throws URISyntaxException{{/callUrl}} {
    Twilio.init(ACCOUNT_SID, AUTH_TOKEN);

    {{#callUrl}}
      {{#toVoiceClient}}
    CallCreator callCreator = Call.Create(new Client("{{toVoiceClient}}"), new PhoneNumber("{{fromPhoneNumber}}"), new URI("{{callUrl}}"));
      {{/toVoiceClient}}
      {{#toPhoneNumber}}
    CallCreator callCreator = Call.Create(new PhoneNumber("{{toPhoneNumber}}"), new PhoneNumber("{{fromPhoneNumber}}"), new URI("{{callUrl}}"));
      {{/toPhoneNumber}}
    {{/callUrl}}
    {{#applicationSid}}
      {{#toVoiceClient}}
    CallCreator callCreator = Call.Create(new Client("{{toVoiceClient}}"), new PhoneNumber("{{fromPhoneNumber}}"), "{{applicationSid}}");
      {{/toVoiceClient}}
      {{#toPhoneNumber}}
    CallCreator callCreator = Call.Create(new PhoneNumber("{{toPhoneNumber}}"), new PhoneNumber("{{fromPhoneNumber}}"), "applicationSid");
      {{/toPhoneNumber}}
    {{/applicationSid}}

    {{#sendDigitsVoice}}callCreator.setSendDigits("{{sendDigitsVoice}}");{{/sendDigitsVoice}}
    {{#callMethod}}callCreator.setMethod(HttpMethod.{{callMethod}});{{/callMethod}}
    {{#callStatusCallback}}callCreator.setStatusCallback("{{callStatusCallback}}");{{/callStatusCallback}}
    {{#callStatusCallbackMethod}}callCreator.setStatusCallbackMethod(HttpMethod.{{callStatusCallbackMethod}});{{/callStatusCallbackMethod}}
    {{#callStatusCallbackEvent}}callCreator.setStatusCallbackEvent(Arrays.asList({{#callStatusCallbackEvents}}"{{.}}",{{/callStatusCallbackEvents}}));{{/callStatusCallbackEvent}}
    {{#callFallbackUrl}}callCreator.setFallbackUrl("{{callFallbackUrl}}");{{/callFallbackUrl}}
    {{#callFallbackMethod}}callCreator.setFallbackMethod(HttpMethod.{{callFallbackMethod}});{{/callFallbackMethod}}
    {{#callIfMachine}}callCreator.setIfMachine("{{callIfMachine}}");{{/callIfMachine}}
    {{#callTimeout}}callCreator.setTimeout({{callTimeout}});{{/callTimeout}}
    {{#callRecord}}callCreator.setRecord({{callRecord}});{{/callRecord}}
    {{#callRecordingChannels}}callCreator.setRecordingChannels("{{callRecordingChannels}}");{{/callRecordingChannels}}
    {{#callRecordingStatusCallback}}callCreator.setRecordingStatusCallback("{{callRecordingStatusCallback}}");{{/callRecordingStatusCallback}}
    {{#callRecordingStatusCallbackMethod}}callCreator.setRecordingStatusCallbackMethod(HttpMethod.{{callRecordingStatusCallbackMethod}});{{/callRecordingStatusCallbackMethod}}
    {{#callSipAuthUsername}}callCreator.setSipAuthUsername("{{callSipAuthUsername}}");{{/callSipAuthUsername}}
    {{#callSipAuthPassword}}callCreator.setSipAuthPassword("{{callSipAuthPassword}}");{{/callSipAuthPassword}}

    Call call = callCreator.execute();

    System.out.println(call.getSid());
  }
}
