import com.twilio.sdk.Twilio;
import com.twilio.sdk.resource.notifications.v1.Service;
import com.twilio.sdk.updater.notifications.v1.ServiceUpdater;

public class UpdateService {
  // Find your Account Sid and Token at twilio.com/user/account
  public static final String ACCOUNT_SID = "ACXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX";
  public static final String AUTH_TOKEN = "{{ auth_token }}";

  public static void main(String args[]) {
    // Initialize the client
    Twilio.init(ACCOUNT_SID, AUTH_TOKEN);

    // Update the service
    ServiceUpdater updater = Service.update("ISxxx");
    updater.setFriendlyName("NewFlowHipSlackChatDock");
    Service service = updater.execute();
    System.out.println(service.toString());
  }
}