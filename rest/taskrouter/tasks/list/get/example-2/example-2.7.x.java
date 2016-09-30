// Install the Java helper library from twilio.com/docs/java/install
import com.twilio.Twilio;
import com.twilio.base.ResourceSet;
import com.twilio.rest.taskrouter.v1.workspace.Task;

public class Example {
  private static final String ACCOUNT_SID = "ACXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX";
  private static final String AUTH_TOKEN = "your_auth_token";
  private static final String WORKSPACE_SID = "WSXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX";

  public static void main(String[] args) {
    Twilio.init(ACCOUNT_SID, AUTH_TOKEN);

    ResourceSet<Task> tasks =
        Task.reader(WORKSPACE_SID).byTaskQueueSid("WQf855e98ad280d0a0a325628e24ca9627").read();

    for (Task task : tasks) {
      System.out.println(task.getAttributes());
    }

    tasks = Task.reader(WORKSPACE_SID).byAssignmentStatus(Task.Status.PENDING).read();

    for (Task task : tasks) {
      System.out.println(task.getAttributes());
    }
  }
}
