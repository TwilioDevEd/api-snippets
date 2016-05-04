// Install the Java helper library from twilio.com/docs/java/install
import com.twilio.sdk.TwilioRestClient;
import com.twilio.sdk.TwilioRestException;
import com.twilio.sdk.resource.factory.sip.CredentialFactory;
import com.twilio.sdk.resource.instance.sip.Credential;
import com.twilio.sdk.resource.list.sip.CredentialList;
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

    // Build a filter for the CredentialList
    List<NameValuePair> params = new ArrayList<NameValuePair>();
    params.add(new BasicNameValuePair("Username", "WeeBey"));
    params.add(new BasicNameValuePair("Password", "05"));
    
    
    CredentialFactory credentialFactory = client.getAccount().getCredentialList("CL32a3c49700934481addd5ce1659f04d2").getCredentialFactory();
    Credential credential = credentialFactory.create(params);
    System.out.println(credential.getSid());
  }
}