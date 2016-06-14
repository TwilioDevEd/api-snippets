// Install the Java helper library from twilio.com/docs/java/install
import com.twilio.sdk.TwilioRestClient;
import com.twilio.sdk.TwilioRestException;
import com.twilio.sdk.resource.instance.SigningKey;
import com.twilio.sdk.resource.list.SigningKeyList;

public class Example {

  // Find your Account Sid and Token at twilio.com/user/account
  public static final String ACCOUNT_SID = "ACXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX";
  public static final String AUTH_TOKEN = "{{ auth_token }}";

  public static void main(String[] args) throws TwilioRestException {
    TwilioRestClient client = new TwilioRestClient(ACCOUNT_SID, AUTH_TOKEN);

    SigningKeyList keys = client.getAccount().getSigningKeys();

    // Loop over keys and print out a property for each one.
    for (SigningKey key : keys) {
      System.out.println(key.getFriendlyName());
    }

  }
}
