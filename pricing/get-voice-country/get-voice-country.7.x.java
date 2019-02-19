// Install the Java helper library from twilio.com/docs/java/install
import com.twilio.Twilio;
import com.twilio.rest.pricing.v2.voice.Country;
import com.twilio.type.InboundCallPrice;

public class Example {
  // Find your Account Sid and Token at twilio.com/user/account
  public static final String ACCOUNT_SID = "ACXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX";
  public static final String AUTH_TOKEN = "your_auth_token";

  public static void main(String[] args) {
    Twilio.init(ACCOUNT_SID, AUTH_TOKEN);

    // Get Twilio Voice pricing information for a specific country
    Country voiceCountry = Country.fetcher("EE").fetch();

    for (InboundCallPrice price : voiceCountry.getInboundCallPrices()) {
      // For each call pricing category, print number type and
      // current (reflecting any discounts your account has) price.
      System.out.println(price.getType());
      System.out.println(price.getCurrentPrice());
    }
  }
}
