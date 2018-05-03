// Install the Java helper library from twilio.com/docs/java/install
import com.twilio.Twilio;
import com.twilio.rest.api.v2010.account.Call;
import com.twilio.rest.api.v2010.account.CallCreator;
import com.twilio.type.PhoneNumber;
import java.net.URI;

public class Example {
  // Find your Account Sid and Token at twilio.com/user/account
  public static final String ACCOUNT_SID = "ACXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX";
  public static final String AUTH_TOKEN = "your_auth_token";

  public static void main(String[] args) {
    Twilio.init(ACCOUNT_SID, AUTH_TOKEN);

    PhoneNumber to_number = new PhoneNumber("+18885551234");
    PhoneNumber from_number = new PhoneNumber("+18885551235");

    Call call = new CallCreator(
        ACCOUNT_SID,
        to_number,
        from_number,
        URI.create("https://handler.twilio.com/twiml/EH8ccdbd7f0b8fe34357da8ce87ebe5a16")
    )
    .setMachineDetection("Enable")
    .create();
  }
}
