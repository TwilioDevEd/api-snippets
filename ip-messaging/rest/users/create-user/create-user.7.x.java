// Install the Java helper library from twilio.com/docs/java/install
import com.twilio.Twilio;
import com.twilio.rest.ipmessaging.v1.service.User;

public class Example {
  // Find your Account Sid and Token at twilio.com/user/account
  public static final String ACCOUNT_SID = "ACCOUNT_SID";
  public static final String AUTH_TOKEN = "AUTH_TOKEN";

  public static final String SERVICE_SID = "SERVICE_SID";

  public static void main(String[] args) {
    // Initialize the client
    Twilio.init(ACCOUNT_SID, AUTH_TOKEN);

    // Create the user
    User user = User.create(SERVICE_SID, "IDENTITY", "ROLE_SID").execute();

    System.out.println(user.getRoleSid());
  }
}
