// Install the Java helper library from twilio.com/docs/java/install
import com.twilio.Twilio;
import com.twilio.base.ResourceSet;
import com.twilio.rest.pricing.v2.messaging.Country;

public class Example {
  // Find your Account Sid and Token at twilio.com/user/account
  public static final String ACCOUNT_SID = "ACXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX";
  public static final String AUTH_TOKEN = "your_auth_token";

  public static void main(String[] args) {
    Twilio.init(ACCOUNT_SID, AUTH_TOKEN);

    // Get a list of countries where Twilio Messaging is available
    ResourceSet<Country> messagingCountries = Country.reader().read();

    for (Country country : messagingCountries) {
      System.out.println(country.getIsoCountry());
    }
  }
}
