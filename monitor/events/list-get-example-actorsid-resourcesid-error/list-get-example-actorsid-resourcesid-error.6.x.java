// Install the Java helper library from twilio.com/docs/java/install
import com.twilio.sdk.TwilioMonitorClient;
import com.twilio.sdk.TwilioRestException;
import com.twilio.sdk.resource.instance.monitor.Event;
import com.twilio.sdk.resource.list.monitor.EventList;
import java.util.HashMap;
import java.util.Map;

public class Example {

  // Find your Account Sid and Token at twilio.com/user/account
  public static final String ACCOUNT_SID = "ACXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX";
  public static final String AUTH_TOKEN = "your_auth_token";

  public static void main(String[] args) throws TwilioRestException {
    TwilioMonitorClient client = new TwilioMonitorClient(ACCOUNT_SID, AUTH_TOKEN);

    Map<String, String> params = new HashMap<String, String>();
    params.put("ActorSid", "USd0afd67cddff4ec7cb0022771a203cb1");
    params.put("ResourceSid", "PN4aa51b930717ea83c91971b86d99018f");
    EventList events = client.getEvents(params);

    for (Event e : events) {
      System.out.println(e.getDescription());
    }
  }
}
