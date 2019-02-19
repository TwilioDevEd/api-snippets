// Install the Java helper library from twilio.com/docs/java/install
import com.twilio.sdk.TwilioRestClient;
import com.twilio.sdk.TwilioRestException;
import com.twilio.sdk.resource.instance.sip.IpAccessControlListMapping;
import com.twilio.sdk.resource.list.sip.IpAccessControlListMappingList;

public class Example { 

  // Find your Account Sid and Token at twilio.com/user/account
  public static final String ACCOUNT_SID = "ACXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX";
  public static final String AUTH_TOKEN = "your_auth_token";

  public static void main(String[] args) throws TwilioRestException {
    TwilioRestClient client = new TwilioRestClient(ACCOUNT_SID, AUTH_TOKEN);

    
    
    IpAccessControlListMappingList ipAccessControlListMappings = client.getAccount().getDomain("SD32a3c49700934481addd5ce1659f04d2").getIpAccessControlListMappings();
    
    // Loop over ipAccessControlListMappings and print out a property for each one.
    for (IpAccessControlListMapping ipAccessControlListMapping : ipAccessControlListMappings) {
      System.out.println(ipAccessControlListMapping.getFriendlyName());
    }
    
  }
}