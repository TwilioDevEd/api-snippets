// Install the Java helper library from twilio.com/docs/java/install
import java.util.HashMap;
import java.util.Map;

import com.twilio.sdk.TwilioRestException;
import com.twilio.sdk.TwilioTaskRouterClient;
import com.twilio.sdk.resource.instance.taskrouter.Task;
import com.twilio.sdk.resource.instance.taskrouter.Workspace;

public class Example {
  // Find your Account Sid and Token at twilio.com/user/account
  private static final String ACCOUNT_SID = "ACXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX";
  private static final String AUTH_TOKEN = "your_auth_token";
  private static final String WORKSPACE_SID = "WSXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX";
  private static final String TASK_SID = "WTXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX";

  public static void main(String[] args) throws TwilioRestException {
    TwilioTaskRouterClient client = new TwilioTaskRouterClient(ACCOUNT_SID, AUTH_TOKEN);

    // update a task's attributes
    Task task = client.getTask(WORKSPACE_SID, TASK_SID);
    Map<String, String> params = new HashMap<String, String>();
    params.put("Attributes", "{\"type\":\"support\"}");
    task.update(params);

    // update a task's attributes #2
    Workspace workspace = client.getWorkspace(WORKSPACE_SID);
    task = workspace.getTask(TASK_SID);
    task.update(params);

    // update a task's attributes with map
    Map<String, String> attributes = new HashMap<String, String>();
    attributes.put("type", "support");
    task.update(attributes, null);

    // cancel a task
    params = new HashMap<String, String>();
    params.put("AssignmentStatus", "canceled");
    params.put("Reason", "waiting too long");
    task.update(params);

    // cancel a task #2
    task.cancel("waiting too long");
  }
}