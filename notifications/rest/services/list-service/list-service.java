// NOTE: This example uses the next generation Twilio helper library - for more
// information on how to download and install this version, visit
// https://www.twilio.com/docs/libraries/java
import com.twilio.sdk.Twilio;
import com.twilio.sdk.resource.ResourceSet;
import com.twilio.sdk.resource.notifications.v1.Service;

import java.util.Iterator;

public class ListService {
  // Find your Account Sid and Token at twilio.com/user/account
  public static final String ACCOUNT_SID = "ACXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX";
  public static final String AUTH_TOKEN = "{{ auth_token }}";

  public static void main(String args[]) {
    // Initialize the client
    Twilio.init(ACCOUNT_SID, AUTH_TOKEN);

    // List the services
    ResourceSet<Service> services = Service.read().execute();
    Iterator<Service> iterator = services.iterator();
    while (iterator.hasNext()) {
      Service service = iterator.next();
      System.out.println(service.toString());
    }
  }
}