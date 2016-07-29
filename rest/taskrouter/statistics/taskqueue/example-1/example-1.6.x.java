// Install the Java helper library from twilio.com/docs/java/install
import com.twilio.sdk.TwilioRestException;
import com.twilio.sdk.TwilioTaskRouterClient;
import com.twilio.sdk.resource.instance.taskrouter.TaskQueueStatistics;
import com.twilio.sdk.resource.instance.taskrouter.TaskQueue;
import com.twilio.sdk.resource.instance.taskrouter.Workspace;

public class Example {
  // Find your Account Sid and Token at twilio.com/user/account
  private static final String ACCOUNT_SID = "ACXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX";
  private static final String AUTH_TOKEN = "your_auth_token";
  private static final String WORKSPACE_SID = "WSXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX";
  private static final String TASKQUEUE_SID = "WQXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX";

  public static void main(String[] args) throws TwilioRestException {
    TwilioTaskRouterClient client = new TwilioTaskRouterClient(ACCOUNT_SID, AUTH_TOKEN);

    TaskQueueStatistics statistics = client.getQueueStatistics(WORKSPACE_SID, TASKQUEUE_SID);
    System.out.println("Reservations Accepted: "+statistics.getReservationsAccepted());

    //alternatively
    TaskQueue taskQueue = client.getTaskQueue(WORKSPACE_SID, TASKQUEUE_SID);
    statistics = taskQueue.getStatistics();
    System.out.println("Reservations Accepted: "+statistics.getReservationsAccepted());
  }
}