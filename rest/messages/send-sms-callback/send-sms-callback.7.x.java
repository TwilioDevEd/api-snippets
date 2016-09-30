// Install the Java helper library from twilio.com/docs/java/install
import com.twilio.Twilio;
import com.twilio.rest.api.v2010.account.Message;
import com.twilio.type.PhoneNumber;

public class Example {
  // Find your Account Sid and Token at twilio.com/user/account
  public static final String ACCOUNT_SID = "ACXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX";
  public static final String AUTH_TOKEN = "your_auth_token";

  public static void main(String[] args) {
    Twilio.init(ACCOUNT_SID, AUTH_TOKEN);

    Message message = Message.create(
      new PhoneNumber("+15558675309"),
      new PhoneNumber("+15017250604"),
      "McAvoy or Stewart? These timelines can get so confusing.")
        .setStatusCallback("http://requestb.in/1234abcd")
        .execute();

    System.out.println(message.getSid());
  }
}
