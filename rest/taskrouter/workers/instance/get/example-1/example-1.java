//Install the Java helper library from twilio.com/docs/java/install
import com.twilio.sdk.TwilioRestException;
import com.twilio.sdk.TwilioTaskRouterClient;
import com.twilio.sdk.resource.instance.taskrouter.Worker;
import com.twilio.sdk.resource.instance.taskrouter.Workspace;

import java.util.Map;
import org.json.simple.parser.ParseException;

public class GetWorker { 

  // Find your Account Sid and Token at twilio.com/user/account
  private static final String ACCOUNT_SID = "{{ account_sid }}";
  private static final String AUTH_TOKEN = "{{ auth_token }}";
  private static final String WORKSPACE_SID = "{{ workspace_sid }}";
  private static final String WORKER_SID = "{{ worker_sid }}";

  public static void main(String[] args) throws TwilioRestException {
    TwilioTaskRouterClient client = new TwilioTaskRouterClient(ACCOUNT_SID, AUTH_TOKEN);

    Worker worker = client.getWorker(WORKSPACE_SID, WORKER_SID);
    System.out.println(worker.getAttributes());

    // alternatively
    Workspace workspace = client.getWorkspace(WORKSPACE_SID);
    Worker worker2 = workspace.getWorker(WORKER_SID);
    System.out.println(worker2.getAttributes());
    
    // alternative to fetching attributes
    Map<String, Object> attributes = worker2.parseAttributes();
    System.out.println(attributes.get("foo"));
  }
}