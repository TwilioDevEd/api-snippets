// Install the Java helper library from twilio.com/docs/java/install
import com.twilio.sdk.TwilioRestClient;
import com.twilio.sdk.TwilioRestException;
import com.twilio.sdk.resource.factory.OutgoingCallerIdFactory;
import com.twilio.sdk.resource.instance.CallerIdValidation;
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
    
    params.put("FriendlyName", "My Home Phone Number");
    params.put("PhoneNumber", "+12349013030");
    
    OutgoingCallerIdFactory callerIdFactory = client.getAccount().getOutgoingCallerIdFactory();
    CallerIdValidation validationAttempt = callerIdFactory.create(params);
    System.out.println(validationAttempt.getValidationCode());
  }
}