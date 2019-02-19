// Install the Java helper library from twilio.com/docs/java/install
import com.twilio.Twilio;
import com.twilio.rest.taskrouter.v1.workspace.TaskQueue;

public class Example {
  private static final String ACCOUNT_SID = "ACXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX";
  private static final String AUTH_TOKEN = "your_auth_token";
  private static final String WORKSPACE_SID = "WSXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX";

  public static void main(String[] args) {
    Twilio.init(ACCOUNT_SID, AUTH_TOKEN);

    TaskQueue taskQueue = TaskQueue
        .creator(WORKSPACE_SID, "English", "WAXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX",
            "WAXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX")
        .setTargetWorkers("languages HAS 'english'")
        .create();

    System.out.println(taskQueue.getFriendlyName());
  }
}
