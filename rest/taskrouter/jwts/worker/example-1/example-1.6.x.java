// Install the Java helper library from twilio.com/docs/java/install
import com.twilio.sdk.taskrouter.TaskRouterWorkerCapability;
import com.twilio.sdk.CapabilityToken.DomainException;

public class Example {
  // Get your Account SID and Auth Token from https://twilio.com/console
  // To set up environment variables, see http://twil.io/secure
  private static final String ACCOUNT_SID = System.getenv("TWILIO_ACCOUNT_SID");
  private static final String AUTH_TOKEN = System.getenv("TWILIO_AUTH_TOKEN");
  private static final String WORKSPACE_SID = "WSXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX";
  private static final String WORKER_SID = "WKXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX";

  public static void main(String[] args) throws DomainException {

    TaskRouterWorkerCapability capability = new TaskRouterWorkerCapability(ACCOUNT_SID, AUTH_TOKEN, WORKSPACE_SID, WORKER_SID);
    capability.allowFetchSubresources();
    capability.allowActivityUpdates();
    capability.allowReservationUpdates();
    String token = capability.generateToken();

    // By default, tokens are good for one hour.
    // Override this default timeout by specifiying a new value (in seconds).
    // For example, to generate a token good for 8 hours:

    token = capability.generateToken(28800);  // 60 * 60 * 8
  }
}