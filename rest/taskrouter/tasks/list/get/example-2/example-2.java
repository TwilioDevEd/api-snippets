// Install the Java helper library from twilio.com/docs/java/install
import java.util.HashMap;
import java.util.Map;

import com.twilio.sdk.TwilioRestException;
import com.twilio.sdk.TwilioTaskRouterClient;
import com.twilio.sdk.resource.instance.taskrouter.Task;
import com.twilio.sdk.resource.instance.taskrouter.Workspace;
import com.twilio.sdk.resource.list.taskrouter.TaskList;

public class Example { 

  // Find your Account Sid and Token at twilio.com/user/account
  private static final String ACCOUNT_SID = "ACXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX";
  private static final String AUTH_TOKEN = "your_auth_token";
  private static final String WORKSPACE_SID = "WSXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX";

  public static void main(String[] args) throws TwilioRestException {
    TwilioTaskRouterClient client = new TwilioTaskRouterClient(ACCOUNT_SID, AUTH_TOKEN);

    Map<String, String> filters = new HashMap<String, String>();
    filters.put("TaskQueueSid", "WQf855e98ad280d0a0a325628e24ca9627");
    TaskList tasks = client.getTasks(WORKSPACE_SID, filters);
    for(Task task : tasks) {
        System.out.println(task.getAttributes());
    }

    // alternatively
    Workspace workspace = client.getWorkspace(WORKSPACE_SID);
    tasks = workspace.getTasks(filters);
    for(Task task : tasks) {
        System.out.println(task.getAttributes());
    }

    filters = new HashMap<String, String>();
    filters.put("AssignmentStatus","pending");
    tasks = workspace.getTasks(filters);
    for(Task task : tasks) {
        System.out.println(task.getAttributes());
    }
  }
}