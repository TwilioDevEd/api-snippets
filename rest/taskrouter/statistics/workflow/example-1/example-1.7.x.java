// Install the Java helper library from twilio.com/docs/java/install
import java.util.Map;

import com.twilio.Twilio;
import com.twilio.rest.taskrouter.v1.workspace.workflow.WorkflowStatistics;

public class Example {
  private static final String ACCOUNT_SID = System.getenv("TWILIO_ACCOUNT_SID");
  private static final String AUTH_TOKEN = System.getenv("TWILIO_AUTH_TOKEN");
  private static final String WORKSPACE_SID = "WSXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX";
  private static final String WORKFLOW_SID = "WWXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX";

  public static void main(String[] args) {
    Twilio.init(ACCOUNT_SID, AUTH_TOKEN);

    WorkflowStatistics statistics = WorkflowStatistics.fetcher(WORKSPACE_SID, WORKFLOW_SID).fetch();

    Map<String, Object> cumulative = statistics.getCumulative();
    Map<String, Object> realtime = statistics.getRealtime();
    Map<String, Object> tasksByStatus = (Map<String, Object>) realtime.get("tasks_by_status");

    System.out.println("Avg Task Acceptance Time: " + cumulative.get("avg_task_acceptance_time"));
    System.out.println("Tasks Entered: " + cumulative.get("tasks_entered"));
    System.out.println("Pending Tasks: " + tasksByStatus.get("pending"));
    System.out.println("Assigned Tasks: " + tasksByStatus.get("assigned"));
  }
}
