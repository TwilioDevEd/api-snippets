// Install the Java helper library from twilio.com/docs/java/install
import com.twilio.Twilio;
import com.twilio.rest.lookups.v1.PhoneNumber;

import java.io.UnsupportedEncodingException;
import java.net.URLEncoder;

public class Example {
  // Get your Account SID and Auth Token from https://twilio.com/console
  // To set up environment variables, see http://twil.io/secure
  public static final String ACCOUNT_SID = System.getenv("TWILIO_ACCOUNT_SID");
  public static final String AUTH_TOKEN = System.getenv("TWILIO_AUTH_TOKEN");

  public static void main(String[] args) throws UnsupportedEncodingException {
    Twilio.init(ACCOUNT_SID, AUTH_TOKEN);

    String nationalNumber = URLEncoder.encode("(510) 867-5310", "UTF-8")
      .replaceAll("\\+", "%20");

    PhoneNumber number = PhoneNumber
        .fetcher(new com.twilio.type.PhoneNumber("+4402077651182"))
        .setCountryCode("US")
        .fetch();

    System.out.println(number.getNationalFormat());
  }
}
