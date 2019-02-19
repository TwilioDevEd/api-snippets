// Install the Java helper library from twilio.com/docs/java/install
import com.twilio.sdk.TwilioRestClient;
import com.twilio.sdk.TwilioRestException;
import com.twilio.sdk.resource.instance.sip.CredentialListMapping;
import com.twilio.sdk.resource.list.sip.CredentialListMappingList;

public class Example { 

  // Find your Account Sid and Token at twilio.com/user/account
  public static final String ACCOUNT_SID = "ACXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX";
  public static final String AUTH_TOKEN = "your_auth_token";

  public static void main(String[] args) throws TwilioRestException {
    TwilioRestClient client = new TwilioRestClient(ACCOUNT_SID, AUTH_TOKEN);

    
    
    CredentialListMappingList credentialListMappings = client.getAccount().getDomain("SD32a3c49700934481addd5ce1659f04d2").getCredentialListMappings();
    
    // Loop over credentialListMappings and print out a property for each one.
    for (CredentialListMapping credentialListMapping : credentialListMappings) {
      System.out.println(credentialListMapping.getFriendlyName());
    }
    
  }
}