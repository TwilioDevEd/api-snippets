// Install the Java helper library from twilio.com/docs/java/install
import java.util.HashMap;
import java.util.Map;

import com.twilio.sdk.TwilioRestException;
import com.twilio.sdk.TwilioTaskRouterClient;
import com.twilio.sdk.resource.instance.taskrouter.Worker;
import com.twilio.sdk.resource.instance.taskrouter.Workspace;
import com.twilio.sdk.resource.list.taskrouter.WorkerList;

public class Example { 

  // Find your Account Sid and Token at twilio.com/user/account
  private static final String ACCOUNT_SID = "ACXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX";
  private static final String AUTH_TOKEN = "{{ auth_token }}";
  private static final String WORKSPACE_SID = "{{ workspace_sid }}";

  public static void main(String[] args) throws TwilioRestException {
    TwilioTaskRouterClient client = new TwilioTaskRouterClient(ACCOUNT_SID, AUTH_TOKEN);

    Map<String, String> filters = new HashMap<String, String>();
    filters.put("Available", "1");
    filters.put("TaskQueueSid", "WQf855e98ad280d0a0a325628e24ca9627");
    WorkerList workers = client.getWorkers(WORKSPACE_SID, filters);
    for(Worker worker : workers) {
        System.out.println(worker.getFriendlyName());
    }

    // alternatively
    Workspace workspace = client.getWorkspace(WORKSPACE_SID);
    workers = workspace.getWorkers(filters);
    for(Worker worker : workers) {
        System.out.println(worker.getFriendlyName());
    }

    filters = new HashMap<String, String>();
    filters.put("TargetWorkersExpression","type == 'leads'");
    workers = workspace.getWorkers(filters);
    for(Worker worker : workers) {
        System.out.println(worker.getFriendlyName());
    }
  }
}