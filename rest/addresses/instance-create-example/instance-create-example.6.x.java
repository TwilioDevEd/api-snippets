// Install the Java helper library from twilio.com/docs/java/install
import com.twilio.sdk.TwilioRestClient;
import com.twilio.sdk.TwilioRestException;
import com.twilio.sdk.resource.instance.Address;
import java.util.HashMap;

public class Example {

  // Find your Account Sid and Token at twilio.com/user/account
  public static final String ACCOUNT_SID = "ACXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX";
  public static final String AUTH_TOKEN = "your_auth_token";

  public static void main(String[] args) throws TwilioRestException {
    TwilioRestClient client = new TwilioRestClient(ACCOUNT_SID, AUTH_TOKEN);

    // Get an object from its sid. If you do not have a sid,
    // check out the list resource examples on this page
    Address address = client.getAccount().create(new HashMap<String, String>() {{
        put("customerName", "Customer 500");
        put("street", "Elm Street");
        put("city", "Racoon");
        put("region", "Mordor");
        put("postalCode", "150");
        put("isoCountry", "AX");
    }});

    System.out.println(address.getCustomerName());
  }
}
