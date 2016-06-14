// NOTE: This example uses the next generation Twilio helper library - for more
// information on how to download and install this version, visit
// https://www.twilio.com/docs/libraries/java
import com.twilio.sdk.Twilio;
import com.twilio.sdk.creator.notifications.v1.ServiceCreator;
import com.twilio.sdk.resource.notifications.v1.Service;

import java.util.Iterator;

public class CreateService {
  // Find your Account Sid and Token at twilio.com/user/account
  public static final String ACCOUNT_SID = "ACXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX";
  public static final String AUTH_TOKEN = "{{ auth_token }}";

  public static void main(String args[]) {
    // Initialize the client
    Twilio.init(ACCOUNT_SID, AUTH_TOKEN);

    // Create the service
    ServiceCreator creator = Service.create();
    creator.setFriendlyName("My Awesome Service");
    Service service = creator.execute();
    System.out.println(service.toString());
  }
}