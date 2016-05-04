// Install the Java helper library from twilio.com/docs/java/install
import com.twilio.sdk.TwilioRestException;
import com.twilio.sdk.TwilioTaskRouterClient;
import com.twilio.sdk.resource.instance.taskrouter.Worker;
import com.twilio.sdk.resource.instance.taskrouter.WorkerStatistics;
import com.twilio.sdk.resource.instance.taskrouter.Workspace;

public class Example { 

  // Find your Account Sid and Token at twilio.com/user/account
  private static final String ACCOUNT_SID = "ACXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX";
  private static final String AUTH_TOKEN = "{{ auth_token }}";
  private static final String WORKSPACE_SID = "{{ workspace_sid }}";
  private static final String WORKER_SID = "{{ worker_sid }}";

  public static void main(String[] args) throws TwilioRestException {
    TwilioTaskRouterClient client = new TwilioTaskRouterClient(ACCOUNT_SID, AUTH_TOKEN);

    WorkerStatistics statistics = client.getWorkerStatistics(WORKSPACE_SID, WORKER_SID);
    System.out.println("Reservations Accepted: "+statistics.getReservationsAccepted());

    //alternatively
    Worker worker = client.getWorkflow(WORKSPACE_SID, WORKER_SID);
    statistics = worker.getStatistics();
    System.out.println("Reservations Accepted: "+statistics.getReservationsAccepted());
  }
}