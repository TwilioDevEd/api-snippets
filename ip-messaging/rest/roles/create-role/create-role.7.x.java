// Install the Java helper library from twilio.com/docs/java/install
import java.util.Arrays;
import java.util.List;

import com.twilio.Twilio;
import com.twilio.rest.ipmessaging.v1.service.Role;

public class Example {
  // Find your Account Sid and Token at twilio.com/user/account
  public static final String ACCOUNT_SID = "ACCOUNT_SID";
  public static final String AUTH_TOKEN = "AUTH_TOKEN";

  public static final String SERVICE_SID = "SERVICE_SID";

  public static void main(String[] args) {
    // Initialize the client
    Twilio.init(ACCOUNT_SID, AUTH_TOKEN);

    List<String> permissions = Arrays.asList("createChannel", "joinChannel");

    // Create a role
    Role role = Role
        .create(SERVICE_SID, "RoleName", Role.RoleType.DEPLOYMENT, permissions)
        .execute();

    System.out.println(role.getSid());
  }
}
