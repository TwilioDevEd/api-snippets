// Install the Java helper library from twilio.com/docs/java/install
import com.twilio.sdk.TwilioRestClient;
import com.twilio.sdk.TwilioRestException;
import com.twilio.sdk.resource.instance.ShortCode;
import com.twilio.sdk.resource.list.ShortCodeList;

public class Example { 

  // Find your Account Sid and Token at twilio.com/user/account
  public static final String ACCOUNT_SID = "ACXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX";
  public static final String AUTH_TOKEN = "your_auth_token";

  public static void main(String[] args) throws TwilioRestException {
    TwilioRestClient client = new TwilioRestClient(ACCOUNT_SID, AUTH_TOKEN);

    
    
    ShortCodeList shortCodes = client.getAccount().getShortCodes();
    
    // Loop over shortCodes and print out a property for each one.
    for (ShortCode shortCode : shortCodes) {
      System.out.println(shortCode.getShortCode());
    }
    
  }
}