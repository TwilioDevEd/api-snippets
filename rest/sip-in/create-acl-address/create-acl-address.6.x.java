// Install the Java helper library from twilio.com/docs/java/install
import com.twilio.sdk.TwilioRestClient;
import com.twilio.sdk.TwilioRestException;
import com.twilio.sdk.resource.factory.sip.IpAddressFactory;
import com.twilio.sdk.resource.instance.sip.IpAddress;
import com.twilio.sdk.resource.list.sip.IpAddressList;
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

    // Build a filter for the IpAddressList
    List<NameValuePair> params = new ArrayList<NameValuePair>();
    params.add(new BasicNameValuePair("FriendlyName", "My office IP Address"));
    params.add(new BasicNameValuePair("IpAddress", "55.102.123.124"));
    
    
    IpAddressFactory ipAddressFactory = client.getAccount().getIpAccessControlList("AL32a3c49700934481addd5ce1659f04d2").getIpAddressFactory();
    IpAddress ipAddress = ipAddressFactory.create(params);
    System.out.println(ipAddress.getSid());
  }
}