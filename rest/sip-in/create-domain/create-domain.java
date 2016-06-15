// Install the Java helper library from twilio.com/docs/java/install
import com.twilio.sdk.TwilioRestClient;
import com.twilio.sdk.TwilioRestException;
import com.twilio.sdk.resource.factory.sip.DomainFactory;
import com.twilio.sdk.resource.instance.sip.Domain;
import com.twilio.sdk.resource.list.sip.DomainList;
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

    // Build a filter for the DomainList
    List<NameValuePair> params = new ArrayList<NameValuePair>();
    params.add(new BasicNameValuePair("FriendlyName", "My Domain"));
    params.add(new BasicNameValuePair("VoiceUrl", "https://demo.twilio.com/welcome"));
    params.add(new BasicNameValuePair("AuthType", "IP_ACL"));
    params.add(new BasicNameValuePair("DomainName", "marlo.sip.twilio.com"));
    
    
    DomainFactory domainFactory = client.getAccount().getDomainFactory();
    Domain domain = domainFactory.create(params);
    System.out.println(domain.getSid());
  }
}