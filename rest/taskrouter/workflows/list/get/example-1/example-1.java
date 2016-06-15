// Install the Java helper library from twilio.com/docs/java/install
import com.twilio.sdk.TwilioRestException;
import com.twilio.sdk.TwilioTaskRouterClient;
import com.twilio.sdk.resource.instance.taskrouter.Workflow;
import com.twilio.sdk.resource.instance.taskrouter.Workspace;
import com.twilio.sdk.resource.list.taskrouter.WorkflowList;

public class ListAllWorkflows { 

  // Find your Account Sid and Token at twilio.com/user/account
  private static final String ACCOUNT_SID = "{{ account_sid }}";
  private static final String AUTH_TOKEN = "{{ auth_token }}";
  private static final String WORKSPACE_SID = "{{ workspace_sid }}";

  public static void main(String[] args) throws TwilioRestException {
    TwilioTaskRouterClient client = new TwilioTaskRouterClient(ACCOUNT_SID, AUTH_TOKEN);

    WorkflowList workflows = client.getWorkflows(WORKSPACE_SID);
    for(Workflow workflow : workflows) {
        System.out.println(workflow.getFriendlyName());
    }

    // alternatively
    Workspace workspace = client.getWorkspace(WORKSPACE_SID);
    workflows = workspace.getWorkflows();
    for(Workflow workflow : workflows) {
        System.out.println(workflow.getFriendlyName());
    }
  }
}