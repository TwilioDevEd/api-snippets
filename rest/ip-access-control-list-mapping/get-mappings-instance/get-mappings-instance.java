// Install the Java helper library from twilio.com/docs/java/install
import com.twilio.sdk.TwilioRestClient;
import com.twilio.sdk.TwilioRestException;
import com.twilio.sdk.resource.instance.sip.IpAccessControlListMapping;

public class Example { 

  // Find your Account Sid and Token at twilio.com/user/account
  public static final String ACCOUNT_SID = "ACXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX";
  public static final String AUTH_TOKEN = "{{ auth_token }}";

  public static void main(String[] args) throws TwilioRestException {
    TwilioRestClient client = new TwilioRestClient(ACCOUNT_SID, AUTH_TOKEN);

    // Get an object from its sid. If you do not have a sid,
    // check out the list resource examples on this page
    IpAccessControlListMapping ipAccessControlListMapping = client.getAccount().getDomain("SD32a3c49700934481addd5ce1659f04d2").getIpAccessControlListMapping("AL95a47094615fe05b7c17e62a7877836c");
    System.out.println(ipAccessControlListMapping.getFriendlyName());
    
  }
}