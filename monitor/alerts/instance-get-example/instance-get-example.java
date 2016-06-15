// Install the Java helper library from twilio.com/docs/java/install
import com.twilio.sdk.TwilioMonitorClient;
import com.twilio.sdk.TwilioRestException;
import com.twilio.sdk.resource.instance.monitor.Alert;

public class Example {

  // Find your Account Sid and Token at twilio.com/user/account
  public static final String ACCOUNT_SID = "ACXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX";
  public static final String AUTH_TOKEN = "your_auth_token";

  public static void main(String[] args) throws TwilioRestException {
    TwilioMonitorClient client = new TwilioMonitorClient(ACCOUNT_SID, AUTH_TOKEN);

    // Get an object from its sid. If you do not have a sid,
    // check out the list resource examples on this page
    Alert alert = client.getAlert("NO5a7a84730f529f0a76b3e30c01315d1a");
    System.out.println(alert.getAlertText());

  }
}