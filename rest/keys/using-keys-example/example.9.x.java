// Install the Java helper library from twilio.com/docs/java/install
import com.twilio.Twilio;
import com.twilio.rest.api.v2010.account.Message;
import com.twilio.type.PhoneNumber;

public class Example {
  // Get your Account SID from https://twilio.com/console
  // To set up environment variables, see http://twil.io/secure
  public static final String ACCOUNT_SID = System.getenv("TWILIO_ACCOUNT_SID");
  public static final String API_KEY = System.getenv("TWILIO_API_KEY");
  public static final String API_SECRET = System.getenv("TWILIO_API_SECRET");

  public static void main(String[] args) {
    Twilio.init(API_KEY, API_SECRET, ACCOUNT_SID);

    Message message = Message.creator(new PhoneNumber("+15558675310"),
        new PhoneNumber("+15017122661"), "Never gonna give you up.").create();

    System.out.println(message.getSid());
  }
}
