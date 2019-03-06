// Install the Java helper library from twilio.com/docs/java/install
import com.twilio.Twilio;

public class Example {
  // Find your Account Sid and Token at twilio.com/user/account
  public static final String ACCOUNT_SID = System.getenv("TWILIO_ACCOUNT_SID");
  public static final String AUTH_TOKEN = System.getenv("TWILIO_AUTH_TOKEN");

  public static void main(String[] args) {
    Twilio.init(ACCOUNT_SID, AUTH_TOKEN);

    // Make API calls here...
  }
}
