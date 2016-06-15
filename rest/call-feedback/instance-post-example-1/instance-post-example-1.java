// Install the Java helper library from twilio.com/docs/java/install
import com.twilio.sdk.TwilioRestClient;
import com.twilio.sdk.TwilioRestException;
import com.twilio.sdk.resource.factory.FeedbackFactory;
import com.twilio.sdk.resource.instance.Call;
import com.twilio.sdk.resource.instance.Feedback;
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
    Call call = client.getAccount().getCall("CAe03b7cd806070d1f32bdb7f1046a41c0");
    FeedbackFactory factory = call.getFeedbackFactory();

    // Build a filter for the AccountList
    List<NameValuePair> params = new ArrayList<NameValuePair>();
    params.add(new BasicNameValuePair("QualityScore", "3"));
    params.add(new BasicNameValuePair("Issue", "imperfect-audio"));
    factory.create(params);

  }
}
