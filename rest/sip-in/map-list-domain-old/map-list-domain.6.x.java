// Install the Java helper library from twilio.com/docs/java/install
import com.twilio.sdk.TwilioRestClient;
import com.twilio.sdk.TwilioRestException;
import com.twilio.sdk.resource.factory.sip.IpAccessControlListMappingFactory;
import com.twilio.sdk.resource.instance.sip.IpAccessControlListMapping;
import com.twilio.sdk.resource.list.sip.IpAccessControlListMappingList;
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

    // Build a filter for the IpAccessControlListMappingList
    List<NameValuePair> params = new ArrayList<NameValuePair>();
    params.add(new BasicNameValuePair("IpAccessControlListSid", "AL95a47094615fe05b7c17e62a7877836c"));
    
    
    IpAccessControlListMappingFactory ipAccessControlListMappingFactory = client.getAccount().getDomain("SD32a3c49700934481addd5ce1659f04d2").getIpAccessControlListMappingFactory();
    IpAccessControlListMapping ipAccessControlListMapping = ipAccessControlListMappingFactory.create(params);
    System.out.println(ipAccessControlListMapping.getSid());
  }
}