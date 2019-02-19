// Install the Java helper library from twilio.com/docs/java/install
import com.twilio.sdk.TwilioRestClient;
import com.twilio.sdk.TwilioRestException;
import com.twilio.sdk.resource.instance.AuthorizedConnectApp;
import com.twilio.sdk.resource.list.AuthorizedConnectAppList;

public class Example { 

  // Find your Account Sid and Token at twilio.com/user/account
  public static final String ACCOUNT_SID = "ACXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX";
  public static final String AUTH_TOKEN = "your_auth_token";

  public static void main(String[] args) throws TwilioRestException {
    TwilioRestClient client = new TwilioRestClient(ACCOUNT_SID, AUTH_TOKEN);

    
    
    AuthorizedConnectAppList authorizedApps = client.getAccount().getAuthorizedConnectApps();
    
    // Loop over authorizedApps and print out a property for each one.
    for (AuthorizedConnectApp authorizedApp : authorizedApps) {
      System.out.println(authorizedApp.getConnectAppHomepageUrl());
    }
    
  }
}