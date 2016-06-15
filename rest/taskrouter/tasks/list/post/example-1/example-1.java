//Install the Java helper library from twilio.com/docs/java/install
import com.twilio.sdk.TwilioRestException;
import com.twilio.sdk.TwilioTaskRouterClient;
import com.twilio.sdk.resource.instance.taskrouter.Task;
import com.twilio.sdk.resource.instance.taskrouter.Workspace;

import java.util.HashMap;
import java.util.Map;
import org.json.simple.parser.ParseException;

public class CreateTask { 

  // Find your Account Sid and Token at twilio.com/user/account
  private static final String ACCOUNT_SID = "{{ account_sid }}";
  private static final String AUTH_TOKEN = "{{ auth_token }}";
  private static final String WORKSPACE_SID = "{{ workspace_sid }}";
  private static final String WORKFLOW_SID = "{{ workflow_sid }}";

  public static void main(String[] args) throws TwilioRestException, ParseException {
    TwilioTaskRouterClient client = new TwilioTaskRouterClient(ACCOUNT_SID, AUTH_TOKEN);

    Map<String, String> params = new HashMap<String, String>();
    params.put("WorkflowSid", WORKFLOW_SID);
    params.put("Attributes", "{\"type\":\"support\"}");
    Task task = client.createTask(WORKSPACE_SID, params);

    System.out.println(task.getAttributes());

    // alternatively
    Workspace workspace = client.getWorkspace(WORKSPACE_SID);
    task = workspace.createTask(params);

    System.out.println(task.getAttributes());

    // alternate #2 using attributes as a map
    Map<String, String> attributes = new HashMap<String, String>();
    attributes.put("type", "support");
    task = workspace.createTask(WORKFLOW_SID, attributes, null, null);

    System.out.println(task.parseAttributes().get("type"));
  }
}