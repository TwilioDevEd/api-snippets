// Install the Java helper library from twilio.com/docs/java/install
import com.twilio.sdk.TwilioRestException;
import com.twilio.sdk.TwilioTaskRouterClient;
import com.twilio.sdk.resource.instance.taskrouter.TaskQueue;
import com.twilio.sdk.resource.instance.taskrouter.Workspace;
import com.twilio.sdk.resource.list.taskrouter.TaskQueueList;

public class ListAllTaskQueues { 

  // Find your Account Sid and Token at twilio.com/user/account
  private static final String ACCOUNT_SID = "{{ account_sid }}";
  private static final String AUTH_TOKEN = "{{ auth_token }}";
  private static final String WORKSPACE_SID = "{{ workspace_sid }}";

  public static void main(String[] args) throws TwilioRestException {
    TwilioTaskRouterClient client = new TwilioTaskRouterClient(ACCOUNT_SID, AUTH_TOKEN);

    TaskQueueList taskQueues = client.getTaskQueues(WORKSPACE_SID);
    for(TaskQueue taskQueue : taskQueues) {
        System.out.println(taskQueue.getFriendlyName());
    }

    // alternatively
    Workspace workspace = client.getWorkspace(WORKSPACE_SID);
    taskQueues = workspace.getTaskQueues();
    for(TaskQueue taskQueue : taskQueues) {
        System.out.println(taskQueue.getFriendlyName());
    }
  }
}