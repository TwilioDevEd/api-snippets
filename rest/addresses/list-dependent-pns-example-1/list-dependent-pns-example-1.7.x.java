// Install the Java helper library from twilio.com/docs/java/install
import com.twilio.rest.Twilio;
import com.twilio.rest.reader.api.v2010.account.address.DependentPhoneNumberReader;
import com.twilio.rest.resource.ResourceSet;
import com.twilio.rest.resource.api.v2010.account.address.DependentPhoneNumber;

public class Example {
  // Find your Account Sid and Token at twilio.com/user/account
  public static final String ACCOUNT_SID = "ACXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX";
  public static final String AUTH_TOKEN = "your_auth_token";

  public static void main(String[] args) {
    Twilio.init(ACCOUNT_SID, AUTH_TOKEN);

    ResourceSet<DependentPhoneNumber> numbers =
        new DependentPhoneNumberReader("AD2a0747eba6abf96b7e3c3ff0b4530f6e").execute();

    // Loop over numbers and print out a property for each one.
    for (DependentPhoneNumber number : numbers) {
      System.out.println(number.getPhoneNumber());
    }
  }
}
