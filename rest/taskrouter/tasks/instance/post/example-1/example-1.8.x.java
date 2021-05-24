// Install the Java helper library from twilio.com/docs/java/install
import com.twilio.Twilio;
import com.twilio.rest.taskrouter.v1.workspace.Task;

public class Example {
  private static final String ACCOUNT_SID = System.getenv("TWILIO_ACCOUNT_SID");
  private static final String AUTH_TOKEN = System.getenv("TWILIO_AUTH_TOKEN");
  private static final String WORKSPACE_SID = "WSXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX";
  private static final String TASK_SID = "WTXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX";

  public static void main(String[] args) {
    Twilio.init(ACCOUNT_SID, AUTH_TOKEN);

    // update a task's attributes
    Task.updater(WORKSPACE_SID, TASK_SID).setAttributes("{\"type\":\"support\"}").update();

    // cancel a task
    Task.updater(WORKSPACE_SID, TASK_SID)
        .setAssignmentStatus(Task.Status.CANCELED)
        .setReason("waiting too long")
        .update();
  }
}
