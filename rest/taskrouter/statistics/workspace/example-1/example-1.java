// Install the Java helper library from twilio.com/docs/java/install
import com.twilio.sdk.TwilioRestException;
import com.twilio.sdk.TwilioTaskRouterClient;
import com.twilio.sdk.resource.instance.taskrouter.Worker;
import com.twilio.sdk.resource.instance.taskrouter.Workspace;
import com.twilio.sdk.resource.instance.taskrouter.WorkspaceStatistics;

public class Example { 

  // Find your Account Sid and Token at twilio.com/user/account
  private static final String ACCOUNT_SID = "ACXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX";
  private static final String AUTH_TOKEN = "your_auth_token";
  private static final String WORKSPACE_SID = "WSXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX";

  public static void main(String[] args) throws TwilioRestException {
    TwilioTaskRouterClient client = new TwilioTaskRouterClient(ACCOUNT_SID, AUTH_TOKEN);

    WorkspaceStatistics statistics = client.getWorkspaceStatistics(WORKSPACE_SID);
    System.out.println("Avg Task Acceptance Time: "+statistics.getAverageTaskAcceptanceTime());
    System.out.println("Tasks Created: "+statistics.getTasksCreated());
    System.out.println("Pending Tasks: "+statistics.getPendingTasks());
    System.out.println("Assigned Tasks: "+statistics.getAssignedTasks());

    //alternatively
    Workspace workspace = client.getWorkspace(WORKSPACE_SID);
    statistics = workspace.getStatistics();
    System.out.println("Avg Task Acceptance Time: "+statistics.getAverageTaskAcceptanceTime());
    System.out.println("Tasks Created: "+statistics.getTasksCreated());
    System.out.println("Pending Tasks: "+statistics.getPendingTasks());
    System.out.println("Assigned Tasks: "+statistics.getAssignedTasks());
  }
}