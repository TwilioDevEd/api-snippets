// Install the Java helper library from twilio.com/docs/java/install
import com.twilio.sdk.TwilioRestClient;
import com.twilio.sdk.TwilioRestException;
import com.twilio.sdk.resource.instance.FeedbackSummary;

public class Example {

  // Find your Account Sid and Token at twilio.com/user/account
  public static final String ACCOUNT_SID = "AC5ef8732a3c49700934481addd5ce1659";
  public static final String AUTH_TOKEN = "{{ auth_token }}";

  public static void main(String[] args) throws TwilioRestException {
    TwilioRestClient client = new TwilioRestClient(ACCOUNT_SID, AUTH_TOKEN);

    // Get an object from its sid. If you do not have a sid,
    // check out the list resource examples on this page
    FeedbackSummary feedbackSummary = client.getAccount().getFeedbackSummary("FSa346467ca321c71dbd5e12f627deb854");
    System.out.println(feedbackSummary.getDateCreated());

  }
}
