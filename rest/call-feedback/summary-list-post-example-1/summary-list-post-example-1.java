// Install the Java helper library from twilio.com/docs/java/install
import com.twilio.sdk.TwilioRestClient;
import com.twilio.sdk.TwilioRestException;
import com.twilio.sdk.resource.instance.FeedbackSummary;
import java.util.HashMap;
import java.util.Map;

public class Example {

  // Find your Account Sid and Token at twilio.com/user/account
  public static final String ACCOUNT_SID = "ACXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX";
  public static final String AUTH_TOKEN = "your_auth_token";

  public static void main(String[] args) throws TwilioRestException {
    TwilioRestClient client = new TwilioRestClient(ACCOUNT_SID, AUTH_TOKEN);


    // Build parameters for the FeedbackSummary
    Map<String, String> params = new HashMap<String, String>();
    params.put("StartDate", "2014-06-01");
    params.put("EndDate", "2014-06-30");
    params.put("IncludeSubaccounts", "true");
    params.put("StatusCallback", "http://www.example.com/feedback");

    // Create FeedbackSummary
    FeedbackSummary summary = client.getAccount().createFeedbackSummary(params);
    System.out.println(summary.getStatus());
  }
}
