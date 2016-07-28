import com.twilio.sdk.Twilio;
import com.twilio.sdk.resource.preview.sync.Service;

public class Example {

  // Find your Account Sid and Token at twilio.com/console
  public static final String ACCOUNT_SID = "ACXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX";
  public static final String AUTH_TOKEN = "your_auth_token";

  public static void main(String[] args) {
    Twilio.init(ACCOUNT_SID, AUTH_TOKEN);

    ResourceSet<Service> services = Service.read().execute();

    for(Service service : services) {
        System.out.println(service.getFriendlyName() + ": " +
                service.getSid());
    }
  }
}