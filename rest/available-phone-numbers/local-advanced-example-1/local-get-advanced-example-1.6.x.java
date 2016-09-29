// Install the Java helper library from twilio.com/docs/java/install
import com.twilio.sdk.TwilioRestClient;
import com.twilio.sdk.TwilioRestException;
import com.twilio.sdk.resource.instance.AvailablePhoneNumber;
import com.twilio.sdk.resource.list.AvailablePhoneNumberList;
import org.apache.http.NameValuePair;
import org.apache.http.message.BasicNameValuePair;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;

public class Example {

  // Find your Account Sid and Token at twilio.com/user/account
  public static final String ACCOUNT_SID = "ACXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX";
  public static final String AUTH_TOKEN = "your_auth_token";

  public static void main(String[] args) throws TwilioRestException {
    TwilioRestClient client = new TwilioRestClient(ACCOUNT_SID, AUTH_TOKEN);

    // Build a filter for the AvailablePhoneNumberList
    HashMap<String, String> params = new HashMap<String, String>();

    params.put("NearLatLong", "37.840699,-122.461853");
    params.put("Distance", "50");
    params.put("Contains", "555");
    params.put("InRegion", "CA");

    AvailablePhoneNumberList numbers = client.getAccount().getAvailablePhoneNumbers(params, "US", "Local");
    List<AvailablePhoneNumber> list = numbers.getPageData();

    // Purchase the first number on the list.
    List<NameValuePair> purchaseParams = new ArrayList<NameValuePair>();
    purchaseParams.add(new BasicNameValuePair("PhoneNumber", list.get(0).getPhoneNumber()));
    client.getAccount().getIncomingPhoneNumberFactory().create(purchaseParams);
  }
}
