// Install the Java helper library from twilio.com/docs/java/install
import java.util.HashMap;
import java.util.Map;

import com.twilio.sdk.TwilioRestException;
import com.twilio.sdk.TwilioTaskRouterClient;
import com.twilio.sdk.resource.instance.taskrouter.TaskQueue;
import com.twilio.sdk.resource.instance.taskrouter.Workspace;

public class CreateTaskQueue { 

  // Find your Account Sid and Token at twilio.com/user/account
  private static final String ACCOUNT_SID = "{{ account_sid }}";
  private static final String AUTH_TOKEN = "{{ auth_token }}";
  private static final String WORKSPACE_SID = "{{ workspace_sid }}";

  public static void main(String[] args) throws TwilioRestException {
    TwilioTaskRouterClient client = new TwilioTaskRouterClient(ACCOUNT_SID, AUTH_TOKEN);

    Map<String, String> params = new HashMap<String, String>();
    params.put("FriendlyName", "English");
    params.put("ReservationActivitySid", "WAff7cbfeb6e4994492f3c2488515bc406");
    params.put("AssignmentActivitySid", "WAaa6f6f4332496c3b53b489fd581c8633");
    params.put("TargetWorkers", "languages HAS 'english'");
    TaskQueue taskQueue = client.createTaskQueue(WORKSPACE_SID, params);

    System.out.println(taskQueue.getFriendlyName());

    // alternatively
    Workspace workspace = client.getWorkspace(WORKSPACE_SID);
    Map<String, String> params2 = new HashMap<String, String>();
    params2.put("FriendlyName", "Spanish");
    params2.put("ReservationActivitySid", "WAff7cbfeb6e4994492f3c2488515bc406");
    params2.put("AssignmentActivitySid", "WAaa6f6f4332496c3b53b489fd581c8633");
    params2.put("TargetWorkers", "languages HAS 'spanish'");

    TaskQueue taskQueue2 = workspace.createTaskQueue(params2);

    System.out.println(taskQueue2.getFriendlyName());
  }
}