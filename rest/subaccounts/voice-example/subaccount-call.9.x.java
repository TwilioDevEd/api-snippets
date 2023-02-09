// Install the Java helper library from twilio.com/docs/java/install
import java.net.URI;
import java.net.URISyntaxException;

import com.twilio.Twilio;
import com.twilio.rest.api.v2010.account.Call;
import com.twilio.type.PhoneNumber;

public class Example {
  // Get your Account SID and Auth Token from https://twilio.com/console
  // To set up environment variables, see http://twil.io/secure
  public static final String SUBACCOUNT_SID = System.getenv("TWILIO_SUBACCOUNT_SID");
  public static final String SUBACCOUNT_AUTH_TOKEN = System.getenv("TWILIO_SUBACCOUNT_AUTH_TOKEN");

  public static void main(String[] args) throws URISyntaxException {
    Twilio.init(SUBACCOUNT_SID, SUBACCOUNT_AUTH_TOKEN);

    Call.creator(new PhoneNumber("+16518675310"), new PhoneNumber("+14158141829"),
        new URI("http://twimlets.com/message?Message%5B0%5D=Hello%20from%20your%20subaccount"))
            .create();
  }
}
