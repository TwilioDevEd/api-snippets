// Install the Java helper library from twilio.com/docs/java/install
import com.twilio.Twilio;
import com.twilio.rest.pricing.v2.phonenumber.Country;
import com.twilio.type.PhoneNumberPrice;

public class Example {
  // Find your Account Sid and Token at twilio.com/user/account
  public static final String ACCOUNT_SID = "ACXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX";
  public static final String AUTH_TOKEN = "your_auth_token";

  public static void main(String[] args) {
    Twilio.init(ACCOUNT_SID, AUTH_TOKEN);

    // Get Twilio PhoneNumber pricing information for a specific country
    Country country = Country.fetcher("US").fetch();

    for (PhoneNumberPrice p : country.getPhoneNumberPrices()) {
      // For each number type, print the type and its current price
      System.out.println(p.getType());
      System.out.println(p.getCurrentPrice());
    }
  }
}
