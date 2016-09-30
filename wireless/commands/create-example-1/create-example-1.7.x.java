// Download the **Next-Gen** twilio-java library from:
// twilio.com/docs/libraries/java#installation-nextgen
import com.twilio.Twilio;
import com.twilio.rest.preview.wireless.Command;

public class Example {

  // Find your Account Sid and Token at twilio.com/console
  public static final String ACCOUNT_SID = "ACXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX";
  public static final String AUTH_TOKEN = "your_auth_token";

  public static void main(String[] args) {
    Twilio.init(ACCOUNT_SID, AUTH_TOKEN);

    Command.create("524116518656369", "wakeup")
      .setCallbackUrl("https://devicemanager.mycompany.com/devices/524116518656369/commands")
      .execute();
  }
}