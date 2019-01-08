// Install the Java helper library from twilio.com/docs/java/install
import com.twilio.sdk.TwilioRestClient;
import com.twilio.sdk.TwilioRestException;
import com.twilio.sdk.resource.instance.OutgoingCallerId;
import com.twilio.sdk.resource.list.OutgoingCallerIdList;
import java.util.HashMap;
import java.util.Map;

public class Example { 

  // Find your Account Sid and Token at twilio.com/user/account
  public static final String ACCOUNT_SID = "ACXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX";
  public static final String AUTH_TOKEN = "your_auth_token";

  public static void main(String[] args) throws TwilioRestException {
    TwilioRestClient client = new TwilioRestClient(ACCOUNT_SID, AUTH_TOKEN);

    // Build a filter for the OutgoingCallerIdList
    Map<String, String> params = new HashMap<String, String>();
    
    params.put("PhoneNumber", "+12349013030");
    
    OutgoingCallerIdList callerIds = client.getAccount().getOutgoingCallerIds(params);
    
    // Loop over callerIds and print out a property for each one.
    for (OutgoingCallerId callerId : callerIds) {
      System.out.println(callerId.getPhoneNumber());
    }
    
  }
}