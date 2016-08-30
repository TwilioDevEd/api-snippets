// Install the Java helper library from twilio.com/docs/java/install
import com.twilio.Twilio;
import com.twilio.rest.pricing.v1.voice.Number;
import com.twilio.type.PhoneNumber;

public class Example {
  // Find your Account Sid and Token at twilio.com/user/account
  public static final String ACCOUNT_SID = "ACXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX";
  public static final String AUTH_TOKEN = "your_auth_token";

  public static void main(String[] args) {
    Twilio.init(ACCOUNT_SID, AUTH_TOKEN);

    // Get Twilio Voice pricing for calls to/from a specific number
    Number voiceNumber = Number.fetch(new PhoneNumber("+15108675309")).execute();

    System.out.println(voiceNumber.getOutboundCallPrice().getCurrentPrice());
  }
}
