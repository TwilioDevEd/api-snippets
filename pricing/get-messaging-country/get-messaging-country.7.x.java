// Install the Java helper library from twilio.com/docs/java/install
import com.twilio.Twilio;
import com.twilio.rest.pricing.v2.messaging.Country;
import com.twilio.type.InboundSmsPrice;

public class Example {
  // Find your Account Sid and Token at twilio.com/user/account
  public static final String ACCOUNT_SID = "ACXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX";
  public static final String AUTH_TOKEN = "your_auth_token";

  public static void main(String[] args) {
    Twilio.init(ACCOUNT_SID, AUTH_TOKEN);

    // Get Twilio Messaging pricing information for a specific country
    Country messagingCountry = Country.fetcher("EE").fetch();

    for (InboundSmsPrice price : messagingCountry.getInboundSmsPrices()) {
      // For each message pricing category, print number type and
      // current (reflecting any discounts your account has) price.
      System.out.println(price.getType());
      System.out.println(price.getCurrentPrice());
    }
  }
}
