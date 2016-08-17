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
  public static final String ACCOUNT_SID = "{{#accountSid}}{{accountSid}}{{/accountSid}}";
  public static final String AUTH_TOKEN = "{{#authToken}}{{authToken}}{{/authToken}}";

  public static void main(String[] args) throws TwilioRestException {
    TwilioRestClient client = new TwilioRestClient(ACCOUNT_SID, AUTH_TOKEN);

    // Build a filter for the CallList
    List<NameValuePair> params = new ArrayList<NameValuePair>();
    params.add(new BasicNameValuePair("Url", "{{#voiceCallUrl}}{{voiceCallUrl}}{{/voiceCallUrl}}"));
    params.add(new BasicNameValuePair("To", "{{#toPhoneNumber}}{{toPhoneNumber}}{{/toPhoneNumber}}"));
    params.add(new BasicNameValuePair("From", "{{#fromPhoneNumber}}{{fromPhoneNumber}}{{/fromPhoneNumber}}"));
    params.add(new BasicNameValuePair("Method", "{{#getHttpMethod}}{{getHttpMethod}}{{/getHttpMethod}}"));
    params.add(new BasicNameValuePair("StatusCallback", "{{#voiceStatusCallbackUrl}}{{voiceStatusCallbackUrl}}{{/voiceStatusCallbackUrl}}"));
    params.add(new BasicNameValuePair("StatusCallbackMethod", "{{#postHttpMethod}}{{postHttpMethod}}{{/postHttpMethod}}"));
    params.add(new BasicNameValuePair("StatusCallbackEvent", "{{#initiatedCallEvent}}{{initiatedCallEvent}}{{/initiatedCallEvent}}"));
    params.add(new BasicNameValuePair("StatusCallbackEvent", "{{#ringingCallEvent}}{{ringingCallEvent}}{{/ringingCallEvent}}"));
    params.add(new BasicNameValuePair("StatusCallbackEvent", "{{#answeredCallEvent}}{{answeredCallEvent}}{{/answeredCallEvent}}"));
    params.add(new BasicNameValuePair("StatusCallbackEvent", "{{#completedCallEvent}}{{completedCallEvent}}{{/completedCallEvent}}"));


    CallFactory callFactory = client.getAccount().getCallFactory();
    Call call = callFactory.create(params);
    System.out.println(call.getSid());
  }
}
