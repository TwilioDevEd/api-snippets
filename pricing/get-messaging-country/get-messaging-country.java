// Install the Java helper library from twilio.com/docs/java/install
import com.twilio.sdk.TwilioPricingClient;
import com.twilio.sdk.TwilioRestException;
import com.twilio.sdk.resource.instance.pricing.VoiceCountry;

public class Example {

	// Find your Account Sid and Token at twilio.com/user/account
	public static final String ACCOUNT_SID = "AC3094732a3c49700934481addd5ce1659";
	public static final String AUTH_TOKEN = "{{ auth_token }}";

	public static void main(String[] args) throws TwilioRestException {
		TwilioPricingClient client = new TwilioPricingClient(ACCOUNT_SID, AUTH_TOKEN);

		// Get Twilio Voice pricing information for a specific country
		VoiceCountry vc = client.getVoiceCountry("EE");

		for (VoiceCountry.InboundCallPrice p : vc.getInboundCallPrices()) {
			// For each call pricing category, print number type and
			// current (reflecting any discounts your account has) price.
			System.out.println(p.getNumberType().toString());
			System.out.println(p.getCurrentPrice().toString());
		}
	}
}
