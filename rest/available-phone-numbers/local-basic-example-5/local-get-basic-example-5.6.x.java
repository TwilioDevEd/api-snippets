// Install the Java helper library from twilio.com/docs/java/install
import com.twilio.sdk.TwilioRestClient;
import com.twilio.sdk.TwilioRestException;
import com.twilio.sdk.resource.instance.AvailablePhoneNumber;
import com.twilio.sdk.resource.list.AvailablePhoneNumberList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.ArrayList;
import org.apache.http.NameValuePair;
import org.apache.http.message.BasicNameValuePair;

public class Example {

  // Find your Account Sid and Token at twilio.com/user/account
  public static final String ACCOUNT_SID = "ACXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX";
  public static final String AUTH_TOKEN = "your_auth_token";

  public static void main(String[] args) throws TwilioRestException {
    TwilioRestClient client = new TwilioRestClient(ACCOUNT_SID, AUTH_TOKEN);

    // Build a filter for the AvailablePhoneNumberList
    Map<String, String> params = new HashMap<String, String>();

    params.put("Contains", " 4420");

    AvailablePhoneNumberList numbers = client.getAccount().getAvailablePhoneNumbers(params, "GB", "Local");
    List<AvailablePhoneNumber> list = numbers.getPageData();

    // Purchase the first number on the list.
    List<NameValuePair> purchaseParams = new ArrayList<NameValuePair>();
    purchaseParams.add(new BasicNameValuePair("PhoneNumber", list.get(0).getPhoneNumber()));
    client.getAccount().getIncomingPhoneNumberFactory().create(purchaseParams);
  }
}
