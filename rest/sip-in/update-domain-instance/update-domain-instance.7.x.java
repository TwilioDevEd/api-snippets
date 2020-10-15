// Install the Java helper library from twilio.com/docs/java/install
import com.twilio.Twilio;
import com.twilio.http.HttpMethod;
import com.twilio.rest.api.v2010.account.sip.Domain;

public class Example {
  // Get your Account SID and Auth Token from https://twilio.com/console
  // To set up environment variables, see http://twil.io/secure
  public static final String ACCOUNT_SID = System.getenv("TWILIO_ACCOUNT_SID");
  public static final String AUTH_TOKEN = System.getenv("TWILIO_AUTH_TOKEN");

  public static void main(String[] args) {
    Twilio.init(ACCOUNT_SID, AUTH_TOKEN);

    // Get an object from its sid. If you do not have a sid,
    // check out the list resource examples on this page
    Domain domain = Domain.updater("SD32a3c49700934481addd5ce1659f04d2")
        .setFriendlyName("Little Kevin")
        .setVoiceMethod(HttpMethod.GET)
        .update();

    System.out.println(domain.getDateUpdated());
  }
}
