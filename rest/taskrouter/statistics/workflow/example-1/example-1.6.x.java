// Install the Java helper library from twilio.com/docs/java/install
import com.twilio.sdk.TwilioRestException;
import com.twilio.sdk.TwilioTaskRouterClient;
import com.twilio.sdk.resource.instance.taskrouter.WorkflowStatistics;
import com.twilio.sdk.resource.instance.taskrouter.Workflow;
import com.twilio.sdk.resource.instance.taskrouter.Workspace;

public class Example {
  // Find your Account Sid and Token at twilio.com/user/account
  private static final String ACCOUNT_SID = "ACXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX";
  private static final String AUTH_TOKEN = "your_auth_token";
  private static final String WORKSPACE_SID = "WSXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX";
  private static final String WORKFLOW_SID = "WWXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX";

  public static void main(String[] args) throws TwilioRestException {
    TwilioTaskRouterClient client = new TwilioTaskRouterClient(ACCOUNT_SID, AUTH_TOKEN);

    WorkflowStatistics statistics = client.getWorkflowStatistics(WORKSPACE_SID, WORKFLOW_SID);
    System.out.println("Avg Task Acceptance Time: "+statistics.getAverageTaskAcceptanceTime());
    System.out.println("Tasks Entered: "+statistics.getTasksEntered());
    System.out.println("Pending Tasks: "+statistics.getPendingTasks());
    System.out.println("Assigned Tasks: "+statistics.getAssignedTasks());

    //alternatively
    Workflow workflow = client.getWorkflow(WORKSPACE_SID, WORKFLOW_SID);
    statistics = workflow.getStatistics();
    System.out.println("Avg Task Acceptance Time: "+statistics.getAverageTaskAcceptanceTime());
    System.out.println("Tasks Entered: "+statistics.getTasksEntered());
    System.out.println("Pending Tasks: "+statistics.getPendingTasks());
    System.out.println("Assigned Tasks: "+statistics.getAssignedTasks());
  }
}