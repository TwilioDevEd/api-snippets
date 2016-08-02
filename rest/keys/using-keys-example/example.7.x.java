// Install the Java helper library from twilio.com/docs/java/install
import com.twilio.rest.Twilio;
import com.twilio.rest.resource.api.v2010.account.Message;
import com.twilio.rest.type.PhoneNumber;

public class Example {
  // Find your Account Sid and Token at twilio.com/user/account
  public static final String ACCOUNT_SID = "ACXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX";
  public static final String API_KEY = "SKXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX";
  public static final String API_SECRET = "your_api_secret";

  public static void main(String[] args) {
    Twilio.init(API_KEY, API_SECRET, ACCOUNT_SID);

    Message message = Message.create(new PhoneNumber("+15558675309"), "Never gonna give you up.",
        new PhoneNumber("+15017250604")).execute();

    System.out.println(message.getSid());
  }
}
