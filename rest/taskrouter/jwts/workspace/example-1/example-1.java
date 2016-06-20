// Install the Java helper library from twilio.com/docs/java/install
import com.twilio.sdk.taskrouter.TaskRouterWorkspaceCapability;
import com.twilio.sdk.CapabilityToken.DomainException;

public class Example {
  // Find your Account Sid and Token at twilio.com/user/account
  private static final String ACCOUNT_SID = "ACXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX";
  private static final String AUTH_TOKEN = "your_auth_token";
  private static final String WORKSPACE_SID = "WSXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX";

  public static void main(String[] args) throws DomainException {
    TaskRouterWorkspaceCapability capability = new TaskRouterWorkspaceCapability(ACCOUNT_SID, AUTH_TOKEN, WORKSPACE_SID);
    capability.allowFetchSubresources();
    capability.allowUpdatesSubresources();
    capability.allowDeleteSubresources();
    String token = capability.generateToken();

    // By default, tokens are good for one hour.
    // Override this default timeout by specifiying a new value (in seconds).
    // For example, to generate a token good for 8 hours:

    token = capability.generateToken(28800);  // 60 * 60 * 8
  }
}