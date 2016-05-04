// Install the Java helper library from twilio.com/docs/java/install
import com.twilio.sdk.TwilioRestClient;
import com.twilio.sdk.TwilioRestException;
import com.twilio.sdk.resource.factory.sip.IpAccessControlListFactory;
import com.twilio.sdk.resource.instance.sip.IpAccessControlList;
import com.twilio.sdk.resource.list.sip.IpAccessControlListList;
import java.util.ArrayList;
import java.util.List;
import org.apache.http.NameValuePair;
import org.apache.http.message.BasicNameValuePair;

public class Example { 

  // Find your Account Sid and Token at twilio.com/user/account
  public static final String ACCOUNT_SID = "ACXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX";
  public static final String AUTH_TOKEN = "{{ auth_token }}";

  public static void main(String[] args) throws TwilioRestException {
    TwilioRestClient client = new TwilioRestClient(ACCOUNT_SID, AUTH_TOKEN);

    // Build a filter for the IpAccessControlListList
    List<NameValuePair> params = new ArrayList<NameValuePair>();
    params.add(new BasicNameValuePair("FriendlyName", "My new acl"));
    
    
    IpAccessControlListFactory ipAccessControlListFactory = client.getAccount().getIpAccessControlListFactory();
    IpAccessControlList ipAccessControlList = ipAccessControlListFactory.create(params);
    System.out.println(ipAccessControlList.getSid());
  }
}