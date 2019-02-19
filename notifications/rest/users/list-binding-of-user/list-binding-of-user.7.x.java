// NOTE: This example uses the next generation Twilio helper library - for more
// information on how to download and install this version, visit
// https://www.twilio.com/docs/libraries/java
import com.twilio.Twilio;
import com.twilio.base.ResourceSet;
import com.twilio.rest.notify.v1.service.user.UserBinding;

public class Example {
  // Find your Account Sid and Token at twilio.com/user/account
  public static final String ACCOUNT_SID = "ACXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX";
  public static final String AUTH_TOKEN = "your_auth_token";

  public static void main(String[] args) {
    // Initialize the client
    Twilio.init(ACCOUNT_SID, AUTH_TOKEN);

    String serviceSid = "ISXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX";
    String identity = "User0001";
    // List the User Bindings
    ResourceSet<UserBinding> userBindings = UserBinding
        .reader(serviceSid, identity).read();

    for (UserBinding userBinding : userBindings) {
      System.out.println(userBinding);
    }
  }
}
