// Install the Java helper library from twilio.com/docs/java/install
import com.twilio.sdk.TwilioRestClient;
import com.twilio.sdk.TwilioRestException;
import com.twilio.sdk.resource.instance.AvailablePhoneNumber;
import com.twilio.sdk.resource.list.AvailablePhoneNumberList;
import java.util.HashMap;
import java.util.List;

public class Example { 

  // Find your Account Sid and Token at twilio.com/user/account
  public static final String ACCOUNT_SID = "ACXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX";
  public static final String AUTH_TOKEN = "{{ auth_token }}";

  public static void main(String[] args) throws TwilioRestException {
    TwilioRestClient client = new TwilioRestClient(ACCOUNT_SID, AUTH_TOKEN);

    
    
    AvailablePhoneNumberList numbers = client.getAccount().getAvailablePhoneNumbers(new HashMap<String, String>(), "GB", "Mobile");
    List<AvailablePhoneNumber> list = numbers.getPageData();
    
    // Purchase the first number in the list.
    List<NameValuePair> purchaseParams = new ArrayList<NameValuePair>();
    purchaseParams.add(new BasicNameValuePair("PhoneNumber", list.get(0).getPhoneNumber()));
    client.getAccount().getIncomingPhoneNumberFactory().create(purchaseParams);
  }
}