// Install the Java helper library from twilio.com/docs/java/install
import com.twilio.Twilio;
import com.twilio.rest.api.v2010.account.sip.Domain;

public class Example {
  // Get your Account SID and Auth Token from https://twilio.com/console
  // To set up environment variables, see http://twil.io/secure
  public static final String ACCOUNT_SID = System.getenv("TWILIO_ACCOUNT_SID");
  public static final String AUTH_TOKEN = System.getenv("TWILIO_AUTH_TOKEN");

  public static void main(String[] args) {
    Twilio.init(ACCOUNT_SID, AUTH_TOKEN);

    Domain domain = Domain.creator("marlo.sip.twilio.com")
        .setFriendlyName("My Domain")
        .setVoiceUrl("https://demo.twilio.com/welcome")
        .setAuthType("IP_ACL")
        .create();

    System.out.println(domain.getSid());
  }
}
