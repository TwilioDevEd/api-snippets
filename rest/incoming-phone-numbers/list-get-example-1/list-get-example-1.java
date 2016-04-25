// Install the Java helper library from twilio.com/docs/java/install
import com.twilio.sdk.TwilioRestClient;
import com.twilio.sdk.TwilioRestException;
import com.twilio.sdk.resource.instance.IncomingPhoneNumber;
import com.twilio.sdk.resource.list.IncomingPhoneNumberList;

public class Example { 

  // Find your Account Sid and Token at twilio.com/user/account
  public static final String ACCOUNT_SID = "ACdc5f132a3c49700934481addd5ce1659";
  public static final String AUTH_TOKEN = "{{ auth_token }}";

  public static void main(String[] args) throws TwilioRestException {
    TwilioRestClient client = new TwilioRestClient(ACCOUNT_SID, AUTH_TOKEN);
    
    IncomingPhoneNumberList numbers = client.getAccount().getIncomingPhoneNumbers();
    
    // Loop over numbers and print out a property for each one.
    for (IncomingPhoneNumber number : numbers) {
      System.out.println(number.getPhoneNumber());
    } 
  }
}