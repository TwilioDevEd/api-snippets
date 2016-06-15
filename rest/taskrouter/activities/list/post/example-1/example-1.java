// Install the Java helper library from twilio.com/docs/java/install
import java.util.HashMap;
import java.util.Map;

import com.twilio.sdk.TwilioRestException;
import com.twilio.sdk.TwilioTaskRouterClient;
import com.twilio.sdk.resource.instance.taskrouter.Activity;
import com.twilio.sdk.resource.instance.taskrouter.Workspace;

public class CreateActivity { 

  // Find your Account Sid and Token at twilio.com/user/account
  private static final String ACCOUNT_SID = "{{ account_sid }}";
  private static final String AUTH_TOKEN = "{{ auth_token }}";
  private static final String WORKSPACE_SID = "{{ workspace_sid }}";

  public static void main(String[] args) throws TwilioRestException {
    TwilioTaskRouterClient client = new TwilioTaskRouterClient(ACCOUNT_SID, AUTH_TOKEN);

    Map<String, String> params = new HashMap<String, String>();
    params.put("FriendlyName", "NewAvailableActivity");
    params.put("Available", "true");
    Activity activity = client.createActivity(WORKSPACE_SID, params);

    System.out.println(activity.getFriendlyName());

    // alternatively
    Workspace workspace = client.getWorkspace(WORKSPACE_SID);
    Map<String, String> params2 = new HashMap<String, String>();
    params2.put("FriendlyName", "NewUnAvailableActivity");
    params2.put("Available", "false");

    Activity activity2 = workspace.createActivity(params2);

    System.out.println(activity2.getFriendlyName());
  }
}