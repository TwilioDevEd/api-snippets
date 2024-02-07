// Install the Java helper library from twilio.com/docs/java/install
import com.twilio.Twilio;
import com.twilio.rest.pricing.v2.voice.Number;
import com.twilio.type.PhoneNumber;

public class Example {
  // Get your Account SID and Auth Token from https://twilio.com/console
  // To set up environment variables, see http://twil.io/secure
  public static final String ACCOUNT_SID = System.getenv("TWILIO_ACCOUNT_SID");
  public static final String AUTH_TOKEN = System.getenv("TWILIO_AUTH_TOKEN");

  public static void main(String[] args) {
    Twilio.init(ACCOUNT_SID, AUTH_TOKEN);

    // Get Twilio Voice pricing for calls to/from a specific number
    Number voiceNumber = Number.fetcher(new PhoneNumber("+15108675310"))
        .setOriginationNumber('+12421234567').fetch();

    System.out.println(voiceNumber.getOutboundCallPrices().getCurrentPrice());
  }
}
