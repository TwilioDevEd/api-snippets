// Install the Java helper library from twilio.com/docs/java/install
import java.util.*;

import com.twilio.Twilio;
import com.twilio.rest.chat.v2.service.Role;

public class Example {
  // Get your Account SID and Auth Token from https://twilio.com/console
  // To set up environment variables, see http://twil.io/secure
  public static final String ACCOUNT_SID = System.getenv("TWILIO_ACCOUNT_SID");
  public static final String AUTH_TOKEN = System.getenv("TWILIO_AUTH_TOKEN");

  public static final String SERVICE_SID = System.getenv("TWILIO_SERVICE_SID");
  public static final String ROLE_SID = "RLXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX";

  public static void main(String[] args) {
    // Initialize the client
    Twilio.init(ACCOUNT_SID, AUTH_TOKEN);

    Role role = Role.fetcher(SERVICE_SID, ROLE_SID).fetch();
    List<String> newPermissions = new ArrayList<>(Arrays.asList("sendMediaMessage"));
    newPermissions.addAll(role.getPermissions());

    // Update the role
    role = Role.updater(SERVICE_SID, ROLE_SID, newPermissions).update();
  }
}
