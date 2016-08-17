// Install the Java helper library from twilio.com/docs/java/install
import java.net.URI;
import java.net.URISyntaxException;
import java.util.Arrays;
import java.util.List;

import com.twilio.Twilio;
import com.twilio.http.HttpMethod;
import com.twilio.rest.api.v2010.account.Call;
import com.twilio.type.PhoneNumber;

public class Example {
  // Find your Account Sid and Token at twilio.com/user/account
  public static final String ACCOUNT_SID = "{{#accountSid}}{{accountSid}}{{/accountSid}}";
  public static final String AUTH_TOKEN = "{{#authToken}}{{authToken}}{{/authToken}}";

  public static void main(String[] args) throws URISyntaxException {
    Twilio.init(ACCOUNT_SID, AUTH_TOKEN);

    List<String> callbackEvents = Arrays.asList("{{#initiatedCallEvent}}{{initiatedCallEvent}}{{/initiatedCallEvent}}", "{{#ringingCallEvent}}{{ringingCallEvent}}{{/ringingCallEvent}}", "{{#answeredCallEvent}}{{answeredCallEvent}}{{/answeredCallEvent}}", "{{#completedCallEvent}}{{completedCallEvent}}{{/completedCallEvent}}");

    Call call = Call
        .create(new PhoneNumber("{{#toPhoneNumber}}{{toPhoneNumber}}{{/toPhoneNumber}}"), new PhoneNumber("{{#fromPhoneNumber}}{{fromPhoneNumber}}{{/fromPhoneNumber}}"),
            new URI("{{#voiceCallUrl}}{{voiceCallUrl}}{{/voiceCallUrl}}"))
        .setMethod(HttpMethod.{{#getHttpMethod}}{{getHttpMethod}}{{/getHttpMethod}}).setStatusCallback("{{#voiceStatusCallbackUrl}}{{voiceStatusCallbackUrl}}{{/voiceStatusCallbackUrl}}")
        .setStatusCallbackMethod(HttpMethod.{{#postHttpMethod}}{{postHttpMethod}}{{/postHttpMethod}}).setStatusCallbackEvent(callbackEvents).execute();

    System.out.println(call.getSid());
  }
}
