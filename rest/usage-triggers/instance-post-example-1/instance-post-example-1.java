// Install the Java helper library from twilio.com/docs/java/install
import com.twilio.sdk.TwilioRestClient;
import com.twilio.sdk.TwilioRestException;
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

    // Get an object from its sid. If you do not have a sid,
    // check out the list resource examples on this page
    UsageTrigger trigger = client.getAccount().getUsageTrigger("UT33c6aeeba34e48f38d6899ea5b765ad4");
    // Build a filter for the UsageTriggerList
    List<NameValuePair> params = new ArrayList<NameValuePair>();
    params.add(new BasicNameValuePair("FriendlyName", "Monthly Maximum Call Usage"));
    params.add(new BasicNameValuePair("CallbackUrl", "https://www.example.com/monthly-usage-trigger"));
    trigger.update(params);
    
  }
}