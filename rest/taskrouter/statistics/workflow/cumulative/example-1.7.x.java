// Install the Java helper library from twilio.com/docs/java/install
import java.util.Map;

import com.twilio.Twilio;
import com.twilio.rest.taskrouter.v1.workspace.workflow.WorkflowStatistics;
import com.twilio.rest.taskrouter.v1.workspace.workflow.WorkflowCumulativeStatistics;

public class Example {
  private static final String ACCOUNT_SID = System.getenv("TWILIO_ACCOUNT_SID");
  private static final String AUTH_TOKEN = System.getenv("TWILIO_AUTH_TOKEN");
  private static final String WORKSPACE_SID = "WSXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX";
  private static final String WORKFLOW_SID = "WWXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX";

  public static void main(String[] args) {
    Twilio.init(ACCOUNT_SID, AUTH_TOKEN);

    WorkflowCumulativeStatistics statistics = WorkflowCumulativeStatistics.fetcher(WORKSPACE_SID, WORKFLOW_SID).fetch();

    System.out.println("Avg Task Acceptance Time: " + statistics.getAvgTaskAcceptanceTime());
    System.out.println("Tasks Entered: " + statistics.getTasksEntered());
  }
}
