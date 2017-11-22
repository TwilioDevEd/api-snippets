// Get the Java helper library from https://twilio.com/docs/libraries/java
import com.twilio.Twilio;
import com.twilio.rest.preview.proxy.service.session.Participant;

public class Example {
  // Get your Account SID and Auth Token from https://twilio.com/console
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
