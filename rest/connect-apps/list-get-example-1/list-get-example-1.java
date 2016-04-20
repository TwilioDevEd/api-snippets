// Install the Java helper library from twilio.com/docs/java/install
import com.twilio.sdk.TwilioRestClient;
import com.twilio.sdk.TwilioRestException;
import com.twilio.sdk.resource.instance.ConnectApp;
import com.twilio.sdk.resource.list.ConnectAppList;

public class Example { 

  // Find your Account Sid and Token at twilio.com/user/account
  public static final String ACCOUNT_SID = "AC81e0ca4b0af06b833b6726957613c5d4";
  public static final String AUTH_TOKEN = "{{ auth_token }}";

  public static void main(String[] args) throws TwilioRestException {
    TwilioRestClient client = new TwilioRestClient(ACCOUNT_SID, AUTH_TOKEN);

    
    
    ConnectAppList connectApps = client.getAccount().getConnectApps();
    
    // Loop over connectApps and print out a property for each one.
    for (ConnectApp connectApp : connectApps) {
      System.out.println(connectApp.getFriendlyName());
    }
    
  }
}