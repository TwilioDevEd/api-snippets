// Install the Java helper library from twilio.com/docs/java/install
import com.twilio.sdk.TwilioRestClient;
import com.twilio.sdk.TwilioRestException;
import com.twilio.sdk.resource.factory.CallFactory;
import com.twilio.sdk.resource.instance.Call;
import com.twilio.sdk.resource.list.CallList;
import java.util.ArrayList;
import java.util.List;
import org.apache.http.NameValuePair;
import org.apache.http.message.BasicNameValuePair;

public class Example {

  // Find your Account Sid and Token at twilio.com/user/account
  public static final String ACCOUNT_SID = "{{accountSid}}";
  public static final String AUTH_TOKEN = "{{authToken}}";

  public static void main(String[] args) throws TwilioRestException {
    TwilioRestClient client = new TwilioRestClient(ACCOUNT_SID, AUTH_TOKEN);

    // Build a filter for the CallList
    List<NameValuePair> params = new ArrayList<NameValuePair>();
    {{#fromPhoneNumber}}params.add(new BasicNameValuePair("From", "{{fromPhoneNumber}}"));{{/fromPhoneNumber}}
    {{#toPhoneNumber}}params.add(new BasicNameValuePair("To", "{{toPhoneNumber}}"));{{/toPhoneNumber}}
    {{#toVoiceClient}}params.add(new BasicNameValuePair("To", "{{toVoiceClient}}"));{{/toVoiceClient}}
    {{#callUrl}}params.add(new BasicNameValuePair("Url", "{{callUrl}}"));{{/callUrl}}
    {{#applicationSid}}params.add(new BasicNameValuePair("ApplicationSid", "{{applicationSid}}")),{{/applicationSid}}
    {{#sendDigitsVoice}}params.add(new BasicNameValuePair("SendDigits", "{{sendDigitsVoice}}"));{{/sendDigitsVoice}}
    {{#callMethod}}params.add(new BasicNameValuePair("Method", "{{callMethod}}"));{{/callMethod}}
    {{#callStatusCallback}}params.add(new BasicNameValuePair("StatusCallback", "{{callStatusCallback}}"));{{/callStatusCallback}}
    {{#callStatusCallbackMethod}}params.add(new BasicNameValuePair("StatusCallbackMethod", "{{callStatusCallbackMethod}}"));{{/callStatusCallbackMethod}}
    {{#callFallbackUrl}}params.add(new BasicNameValuePair("FallbackUrl", "{{callFallbackUrl}}"));{{/callFallbackUrl}}
    {{#callFallbackMethod}}params.add(new BasicNameValuePair("FallbackMethod", "{{callFallbackMethod}}"));{{/callFallbackMethod}}
    {{#callIfMachine}}params.add(new BasicNameValuePair("IfMachine", "{{callIfMachine}}"));{{/callIfMachine}}
    {{#callTimeout}}params.add(new BasicNameValuePair("Timeout", "{{callTimeout}}"));{{/callTimeout}}
    {{#callRecord}}params.add(new BasicNameValuePair("Record", "{{callRecord}}"));{{/callRecord}}
    {{#callRecordingChannels}}params.add(new BasicNameValuePair("RecordingChannels", "{{callRecordingChannels}}"));{{/callRecordingChannels}}
    {{#callRecordingStatusCallback}}params.add(new BasicNameValuePair("RecordingStatusCallback", "{{callRecordingStatusCallback}}"));{{/callRecordingStatusCallback}}
    {{#callRecordingStatusCallbackMethod}}params.add(new BasicNameValuePair("RecordingStatusCallbackMethod", "{{callRecordingStatusCallbackMethod}}"));{{/callRecordingStatusCallbackMethod}}
    {{#callSipAuthUsername}}params.add(new BasicNameValuePair("SipAuthUsername", "{{callSipAuthUsername}}"));{{/callSipAuthUsername}}
    {{#callSipAuthPassword}}params.add(new BasicNameValuePair("SipAuthPassword", "{{callSipAuthPassword}}"));{{/callSipAuthPassword}}
    {{#callStatusCallbackEvents}}
    params.add(new BasicNameValuePair("StatusCallbackEvent", "{{.}}"));
    {{/callStatusCallbackEvents}}

    CallFactory callFactory = client.getAccount().getCallFactory();
    Call call = callFactory.create(params);
    System.out.println(call.getSid());
  }
}
