// Install the Java helper library from twilio.com/docs/java/install
import com.twilio.rest.Twilio;
import com.twilio.rest.creator.api.v2010.account.incomingphonenumber.TollFreeCreator;
import com.twilio.rest.reader.api.v2010.account.availablephonenumbercountry.TollFreeReader;
import com.twilio.rest.resource.ResourceSet;
import com.twilio.rest.resource.api.v2010.account.availablephonenumbercountry.TollFree;
import com.twilio.rest.type.PhoneNumber;

public class Example {
  // Find your Account Sid and Token at twilio.com/user/account
  public static final String ACCOUNT_SID = "ACXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX";
  public static final String AUTH_TOKEN = "your_auth_token";

  public static void main(String[] args) {
    Twilio.init(ACCOUNT_SID, AUTH_TOKEN);

    ResourceSet<TollFree> numbers = new TollFreeReader("US").execute();
    PhoneNumber availableNumber = numbers.iterator().next().getPhoneNumber();

    new TollFreeCreator(availableNumber).execute();
  }
}
