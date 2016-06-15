// Install the Java helper library from twilio.com/docs/java/install
import com.twilio.sdk.TwilioRestException;
import com.twilio.sdk.TwilioTaskRouterClient;
import com.twilio.sdk.resource.instance.taskrouter.WorkersStatistics;
import com.twilio.sdk.resource.instance.taskrouter.Workspace;


public class Example { 

  // Find your Account Sid and Token at twilio.com/user/account
  private static final String ACCOUNT_SID = "ACXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX";
  private static final String AUTH_TOKEN = "your_auth_token";
  private static final String WORKSPACE_SID = "WSXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX";

  public static void main(String[] args) throws TwilioRestException {
    TwilioTaskRouterClient client = new TwilioTaskRouterClient(ACCOUNT_SID, AUTH_TOKEN);

    WorkersStatistics statistics = client.getWorkersStatistics(WORKSPACE_SID);
    System.out.println("Reservations Accepted: "+statistics.getReservationsAccepted());

    //alternatively
    Workspace workspace = client.getWorkspace(WORKSPACE_SID);
    statistics = workspace.getWorkers().getStatistics();
    System.out.println("Reservations Accepted: "+statistics.getReservationsAccepted());
  }
}