import com.twilio.sdk.Twilio;
import com.twilio.sdk.resource.notifications.v1.Service;

public class RetrieveService {
  // Find your Account Sid and Token at twilio.com/user/account
  public static final String ACCOUNT_SID = "ACXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX";
  public static final String AUTH_TOKEN = "{{ auth_token }}";

  public static void main(String args[]) {
    // Initialize the client
    Twilio.init(ACCOUNT_SID, AUTH_TOKEN);

    // Fetch the service
    Service service = Service.fetch("ISxxx").execute();
    System.out.println(service.toString());
  }
}