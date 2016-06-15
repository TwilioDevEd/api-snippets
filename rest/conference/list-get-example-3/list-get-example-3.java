// Install the Java helper library from twilio.com/docs/java/install
import com.twilio.sdk.TwilioRestClient;
import com.twilio.sdk.TwilioRestException;
import com.twilio.sdk.resource.instance.Conference;
import com.twilio.sdk.resource.list.ConferenceList;
import java.util.HashMap;
import java.util.Map;

public class Example { 

  // Find your Account Sid and Token at twilio.com/user/account
  public static final String ACCOUNT_SID = "ACXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX";
  public static final String AUTH_TOKEN = "your_auth_token";

  public static void main(String[] args) throws TwilioRestException {
    TwilioRestClient client = new TwilioRestClient(ACCOUNT_SID, AUTH_TOKEN);

    // Build a filter for the ConferenceList
    Map<String, String> params = new HashMap<String, String>();
    
    params.put("Status", "completed");
    params.put("DateCreated", "2009-07-06");
    
    ConferenceList conferences = client.getAccount().getConferences(params);
    
    // Loop over conferences and print out a property for each one.
    for (Conference conference : conferences) {
      System.out.println(conference.getStatus());
    }
    
  }
}