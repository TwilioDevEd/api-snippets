// Install the Java helper library from twilio.com/docs/java/install
import com.twilio.sdk.TwilioRestClient;
import com.twilio.sdk.TwilioRestException;
import com.twilio.sdk.resource.instance.Address;
import com.twilio.sdk.resource.list.AddressList;

public class Example {

  // Find your Account Sid and Token at twilio.com/user/account
  public static final String ACCOUNT_SID = "ACXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX";
  public static final String AUTH_TOKEN = "{{ auth_token }}";

  public static void main(String[] args) throws TwilioRestException {
    TwilioRestClient client = new TwilioRestClient(ACCOUNT_SID, AUTH_TOKEN);

    // Build a filter for the AddressList
    Map<String, String> params = new HashMap<String, String>();

    params.put("CustomerName", "Customer 123");

    AddressList addresses = client.getAccount().getAddresses(params);

    // Loop over addresses and print out a property for each one.
    for (Address address : addresses) {
      System.out.println(address.getFriendlyName());
    }

  }
}
