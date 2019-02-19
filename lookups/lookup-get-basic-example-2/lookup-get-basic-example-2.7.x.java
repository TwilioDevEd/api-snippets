// Install the Java helper library from twilio.com/docs/java/install
import java.io.UnsupportedEncodingException;
import java.net.URLEncoder;

import com.twilio.Twilio;
import com.twilio.rest.lookups.v1.PhoneNumber;

public class Example {
  // Find your Account Sid and Token at twilio.com/user/account
  public static final String ACCOUNT_SID = "ACXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX";
  public static final String AUTH_TOKEN = "your_auth_token";

  public static void main(String[] args) throws UnsupportedEncodingException {
    Twilio.init(ACCOUNT_SID, AUTH_TOKEN);

    String nationalNumber = URLEncoder.encode("(510) 867-5310", "UTF-8").replaceAll("\\+", "%20");

    PhoneNumber number = PhoneNumber
        .fetcher(new com.twilio.type.PhoneNumber(nationalNumber))
        .setType("carrier")
        .setCountryCode("US")
        .fetch();

    System.out.println(number.getCarrier().get("name"));
    System.out.println(number.getCarrier().get("type"));
  }
}
