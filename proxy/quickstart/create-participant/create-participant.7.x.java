// Install the Java helper library from twilio.com/docs/java/install
import com.twilio.Twilio;
import com.twilio.rest.preview.proxy.service.session.Participant;

public class Example {
  // Find your Account Sid and Token at twilio.com/user/account
  public static final String ACCOUNT_SID = "ACXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX";
  public static final String AUTH_TOKEN = "your_auth_token";

  public static void main(String[] args) {
    Twilio.init(ACCOUNT_SID, AUTH_TOKEN);

    Participant participant = Participant.creator(
      "KSXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX",
      "KCXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX",
      "+15558675309")
      .create();

    System.out.println(participant.getSid());
  }
}
