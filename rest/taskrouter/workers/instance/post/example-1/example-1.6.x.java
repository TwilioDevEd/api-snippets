// Install the Java helper library from twilio.com/docs/java/install
import java.util.HashMap;
import java.util.Map;

import com.twilio.sdk.TwilioRestException;
import com.twilio.sdk.TwilioTaskRouterClient;
import com.twilio.sdk.resource.instance.taskrouter.Worker;
import com.twilio.sdk.resource.instance.taskrouter.Workspace;

public class Example {

  // Find your Account Sid and Token at twilio.com/user/account
  private static final String ACCOUNT_SID = "ACXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX";
  private static final String AUTH_TOKEN = "your_auth_token";
  private static final String WORKSPACE_SID = "WSXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX";
  private static final String WORKER_SID = "WKXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX";

  public static void main(String[] args) throws TwilioRestException {
    TwilioTaskRouterClient client = new TwilioTaskRouterClient(ACCOUNT_SID, AUTH_TOKEN);

    Worker worker = client.getWorker(WORKSPACE_SID, WORKER_SID);
    Map<String, String> params = new HashMap<String, String>();
    params.put("Attributes", "{\"type\":\"support\"}");
    worker.update(params);

    //alternatively
    Workspace workspace = client.getWorkspace(WORKSPACE_SID);
    worker = workspace.getWorker(WORKER_SID);
    worker.update(params);

    // alternate #2 using attributes as a map
    Map<String, String> attributes = new HashMap<String, String>();
    attributes.put("type", "support");
    worker.update(attributes, null, null);
  }
}
