// Install the Java helper library from twilio.com/docs/java/install
import com.twilio.sdk.LookupsClient;
import com.twilio.sdk.TwilioRestException;
import com.twilio.sdk.resource.instance.lookups.PhoneNumber;

public class Example {

  // Find your Account Sid and Token at twilio.com/user/account
  public static final String ACCOUNT_SID = "ACXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX";
  public static final String AUTH_TOKEN = "your_auth_token";

  public static void main(String[] args) throws TwilioRestException {
    LookupsClient client = new LookupsClient(ACCOUNT_SID, AUTH_TOKEN);

    PhoneNumber number = client.getPhoneNumber("+15108675310", true);

    System.out.println(number.getType());
    System.out.println(number.getCarrierName());
  }
}
