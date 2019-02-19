// Install the Java helper library from twilio.com/docs/java/install
import com.twilio.sdk.TwilioRestClient;
import com.twilio.sdk.TwilioRestException;
import com.twilio.sdk.resource.instance.DependentPhoneNumber;
import com.twilio.sdk.resource.list.DependentPhoneNumberList;

public class Example {

  // Find your Account Sid and Token at twilio.com/user/account
  public static final String ACCOUNT_SID = "ACXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX";
  public static final String AUTH_TOKEN = "your_auth_token";

  public static void main(String[] args) throws TwilioRestException {
    TwilioRestClient client = new TwilioRestClient(ACCOUNT_SID, AUTH_TOKEN);

    DependentPhoneNumberList numbers = client.getAccount().getAddress("AD2a0747eba6abf96b7e3c3ff0b4530f6e").getDependentPhoneNumbers();

    // Loop over numbers and print out a property for each one.
    for (DependentPhoneNumber number : numbers) {
      System.out.println(number.getPhoneNumber());
    }

  }
}
