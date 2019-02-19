// Install the Java helper library from twilio.com/docs/java/install
import com.twilio.sdk.TwilioRestClient;
import com.twilio.sdk.TwilioRestException;
import com.twilio.sdk.resource.instance.sip.IpAddress;
import com.twilio.sdk.resource.list.sip.IpAddressList;

public class Example { 

  // Find your Account Sid and Token at twilio.com/user/account
  public static final String ACCOUNT_SID = "ACXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX";
  public static final String AUTH_TOKEN = "your_auth_token";

  public static void main(String[] args) throws TwilioRestException {
    TwilioRestClient client = new TwilioRestClient(ACCOUNT_SID, AUTH_TOKEN);

    
    
    IpAddressList ipAddresss = client.getAccount().getIpAccessControlList("AL32a3c49700934481addd5ce1659f04d2").getIpAddresses();
    
    // Loop over ipAddresss and print out a property for each one.
    for (IpAddress ipAddress : ipAddresss) {
      System.out.println(ipAddress.getFriendlyName());
    }
    
  }
}