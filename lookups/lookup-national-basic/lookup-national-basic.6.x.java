// Install the Java helper library from twilio.com/docs/libraries/java
import com.twilio.sdk.LookupsClient;
import com.twilio.sdk.TwilioRestException;
import com.twilio.sdk.resource.instance.lookups.PhoneNumber;

import java.io.UnsupportedEncodingException;
import java.net.URLEncoder;

public class Example {

  // Find your Account Sid and Token at twilio.com/console
  public static final String ACCOUNT_SID = "ACXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX";
  public static final String AUTH_TOKEN = "your_auth_token";

  public static void main(String[] args) throws TwilioRestException, UnsupportedEncodingException {
      LookupsClient client = new LookupsClient(ACCOUNT_SID, AUTH_TOKEN);

      String nationalNumber = URLEncoder.encode("(510) 867-5310", "UTF-8")
              .replaceAll("\\+", "%20");
      PhoneNumber number = client.getPhoneNumber(nationalNumber, "US", false);
      
      System.out.println(number.getFormattedNumber());
  }
}
