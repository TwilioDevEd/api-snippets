// Install the Java helper library from twilio.com/docs/java/install
import com.twilio.sdk.TwilioMonitorClient;
import com.twilio.sdk.TwilioRestException;
import com.twilio.sdk.resource.instance.monitor.Alert;
import com.twilio.sdk.resource.list.monitor.AlertList;
import java.util.HashMap;
import java.util.Map;

public class Example {

  // Find your Account Sid and Token at twilio.com/user/account
  public static final String ACCOUNT_SID = "ACXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX";
  public static final String AUTH_TOKEN = "your_auth_token";

  public static void main(String[] args) throws TwilioRestException {
    TwilioMonitorClient client = new TwilioMonitorClient(ACCOUNT_SID, AUTH_TOKEN);

    // Build a filter for the AlertList
    Map<String, String> params = new HashMap<String, String>();

    params.put("StartDate", "2015-04-01T00:00:00Z");
    params.put("EndDate", "2015-04-30T23:59:59Z");
    params.put("LogLevel", "warning");

    AlertList alerts = client.getAlerts(params);

    // Loop over alerts and print out a property for each one.
    for (Alert alert : alerts) {
      System.out.println(alert.getResponseBody());
    }
  }
}
