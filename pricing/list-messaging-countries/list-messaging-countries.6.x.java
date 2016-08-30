// Install the Java helper library from twilio.com/docs/java/install
import com.twilio.sdk.TwilioPricingClient;
import com.twilio.sdk.TwilioRestException;
import com.twilio.sdk.resource.list.pricing.MessagingCountryList;
import com.twilio.sdk.resource.instance.pricing.MessagingCountry;

public class Example {

	// Find your Account Sid and Token at twilio.com/user/account
	public static final String ACCOUNT_SID = "ACXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX";
	public static final String AUTH_TOKEN = "your_auth_token";

	public static void main(String[] args) throws TwilioRestException {
		TwilioPricingClient client = new TwilioPricingClient(ACCOUNT_SID, AUTH_TOKEN);

		// Get a list of countries where Twilio Messaging is available
		MessagingCountryList list = client.getMessagingCountries();

		for (MessagingCountry c : list.getPageData()) {
			System.out.println(c.getIsoCountry());
		}
	}
}
