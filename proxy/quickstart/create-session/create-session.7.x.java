// Install the Java helper library from twilio.com/docs/java/install
import com.twilio.Twilio;
import com.twilio.rest.preview.proxy.service.Session;

public class Example {
  // Find your Account Sid and Token at twilio.com/user/account
  public static final String ACCOUNT_SID = "ACXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX";
  public static final String AUTH_TOKEN = "your_auth_token";

  public static void main(String[] args) {
    Twilio.init(ACCOUNT_SID, AUTH_TOKEN);

    Session session = Session.creator("KSXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX")
      .setUniqueName("MyFirstSession").create();

    System.out.println(session.getUniqueName());
  }
}
