// Install the Java helper library from twilio.com/docs/java/install
import java.util.HashMap;
import java.util.Map;

import com.twilio.sdk.TwilioRestException;
import com.twilio.sdk.TwilioTaskRouterClient;
import com.twilio.sdk.resource.instance.taskrouter.TaskQueue;
import com.twilio.sdk.resource.instance.taskrouter.Workspace;

public class Example { 

  // Find your Account Sid and Token at twilio.com/user/account
  private static final String ACCOUNT_SID = "ACXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX";
  private static final String AUTH_TOKEN = "{{ auth_token }}";
  private static final String WORKSPACE_SID = "{{ workspace_sid }}";
  private static final String TASKQUEUE_SID = "{{ taskqueue_sid }}";

  public static void main(String[] args) throws TwilioRestException {
    TwilioTaskRouterClient client = new TwilioTaskRouterClient(ACCOUNT_SID, AUTH_TOKEN);

    TaskQueue taskQueue = client.getTaskQueue(WORKSPACE_SID, TASKQUEUE_SID);
    Map<String, String> params = new HashMap<String, String>();
    params.put("TargetWorkers", "languages HAS 'english'}");
    taskQueue.update(params);

    //alternatively
    Workspace workspace = client.getWorkspace(WORKSPACE_SID);
    taskQueue = workspace.getTaskQueue(TASKQUEUE_SID);
    taskQueue.update(params);
  }
}