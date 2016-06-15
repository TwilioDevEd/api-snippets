//Install the Java helper library from twilio.com/docs/java/install
import com.twilio.sdk.TwilioRestException;
import com.twilio.sdk.TwilioTaskRouterClient;
import com.twilio.sdk.resource.instance.taskrouter.Task;
import com.twilio.sdk.resource.instance.taskrouter.Workspace;

import java.util.Map;
import org.json.simple.parser.ParseException;

public class GetTask { 

  // Find your Account Sid and Token at twilio.com/user/account
  private static final String ACCOUNT_SID = "{{ account_sid }}";
  private static final String AUTH_TOKEN = "{{ auth_token }}";
  private static final String WORKSPACE_SID = "{{ workspace_sid }}";
  private static final String TASK_SID = "{{ task_sid }}";

  public static void main(String[] args) throws TwilioRestException, ParseException {
    TwilioTaskRouterClient client = new TwilioTaskRouterClient(ACCOUNT_SID, AUTH_TOKEN);

    Task task = client.getTask(WORKSPACE_SID, TASK_SID);
    System.out.println(task.getAttributes());

    // alternatively
    Workspace workspace = client.getWorkspace(WORKSPACE_SID);
    task = workspace.getTask(TASK_SID);
    System.out.println(task.getAttributes());

    // alternative to fetching attributes
    Map<String, Object> attributes = task.parseAttributes();
    System.out.println(attributes.get("type"));
  }
}