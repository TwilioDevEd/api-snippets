// Install the Java helper library from twilio.com/docs/java/install
import com.twilio.sdk.taskrouter.TaskRouterWorkerCapability;

public class Example { 

  // Find your Account Sid and Token at twilio.com/user/account
  private static final String ACCOUNT_SID = "ACXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX";
  private static final String AUTH_TOKEN = "{{ auth_token }}";
  private static final String WORKSPACE_SID = "{{ workspace_sid }}";
  private static final String WORKER_SID = "{{ worker_sid }}";

  public static void main(String[] args) {

    TaskRouterWorkerCapability capability = new TaskRouterWorkerCapability(ACCOUNT_SID, AUTH_TOKEN, WORKSPACE_SID, WORKER_SID);
    capability.allowActivityUpdates();
    capability.allowReservationUpdates();
    String token = capability.generateToken();

    // By default, tokens are good for one hour.
    // Override this default timeout by specifiying a new value (in seconds).
    // For example, to generate a token good for 8 hours:

    token = capability.generateToken(28800);  // 60 * 60 * 8
  }
}