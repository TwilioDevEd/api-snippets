// Install the Java helper library from twilio.com/docs/java/install
import com.twilio.sdk.TwilioRestClient;
import com.twilio.sdk.TwilioRestException;
import com.twilio.sdk.resource.factory.UsageTriggerFactory;
import com.twilio.sdk.resource.instance.UsageTrigger;
import com.twilio.sdk.resource.list.UsageTriggerList;
import java.util.ArrayList;
import java.util.List;
import org.apache.http.NameValuePair;
import org.apache.http.message.BasicNameValuePair;

public class Example { 

  // Find your Account Sid and Token at twilio.com/user/account
  public static final String ACCOUNT_SID = "ACXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX";
  public static final String AUTH_TOKEN = "your_auth_token";

  public static void main(String[] args) throws TwilioRestException {
    TwilioRestClient client = new TwilioRestClient(ACCOUNT_SID, AUTH_TOKEN);

    // Build a filter for the UsageTriggerList
    List<NameValuePair> params = new ArrayList<NameValuePair>();
    params.add(new BasicNameValuePair("TriggerValue", "1000"));
    params.add(new BasicNameValuePair("UsageCategory", "sms"));
    params.add(new BasicNameValuePair("CallbackUrl", "http://www.example.com/"));
    
    
    UsageTriggerFactory triggerFactory = client.getAccount().getUsageTriggerFactory();
    UsageTrigger trigger = triggerFactory.create(params);
    System.out.println(trigger.getSid());
  }
}