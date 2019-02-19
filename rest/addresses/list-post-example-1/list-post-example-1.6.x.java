// Install the Java helper library from twilio.com/docs/java/install
import com.twilio.sdk.TwilioRestClient;
import com.twilio.sdk.TwilioRestException;
import com.twilio.sdk.resource.instance.Address;
import com.twilio.sdk.resource.factory.AddressFactory;
import java.util.ArrayList;
import java.util.List;
import org.apache.http.NameValuePair;
import org.apache.http.message.BasicNameValuePair;

public class Example {

  // Find your Account Sid and Token at twilio.com/user/account
  public static final String ACCOUNT_SID = "ACXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX";
  public static final String AUTH_TOKEN = "your_auth_token";

  public static void main(String[] args) throws TwilioRestException {
    TwilioRestClient client = new TwilioRestClient(ACCOUNT_SID, AUTH_TOKEN);

    List<NameValuePair> params = new ArrayList<NameValuePair>();
    params.add(new BasicNameValuePair("FriendlyName", "Billing - Customer 123"));
    params.add(new BasicNameValuePair("CustomerName", "Customer 123"));
    params.add(new BasicNameValuePair("Street", "1 Hasselhoff Lane"));
    params.add(new BasicNameValuePair("City", "Berlin"));
    params.add(new BasicNameValuePair("Region", "Berlin"));
    params.add(new BasicNameValuePair("PostalCode", "10875"));
    params.add(new BasicNameValuePair("IsoCountry", "DE"));
    AddressFactory factory = client.getAccount().getAddressFactory();
    Address address = factory.create(params);
    System.out.println(address.getSid());
  }
}
