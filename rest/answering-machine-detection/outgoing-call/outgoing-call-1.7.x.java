// Install the Java helper library from twilio.com/docs/java/install
import com.twilio.Twilio;
import com.twilio.rest.api.v2010.account.Call;

public class Example {
  // Find your Account Sid and Token at twilio.com/user/account
  public static final String ACCOUNT_SID = "ACXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX";
  public static final String AUTH_TOKEN = "your_auth_token";

  public static void main(String[] args) {
    Twilio.init(ACCOUNT_SID, AUTH_TOKEN);

    Call call = CallUpdater("CA42ed11f93dc08b952027ffbc406d0868")
        .setTo("+1562300000")
        .setFrom("+18180000000")
        .setMachineDetection("Enable")
        .setUrl("https://handler.twilio.com/twiml/EH8ccdbd7f0b8fe34357da8ce87ebe5a16");
  }
}
