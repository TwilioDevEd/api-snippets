// Install the Java helper library from twilio.com/docs/java/install
import com.twilio.sdk.TwilioPricingClient;
import com.twilio.sdk.TwilioRestException;
import com.twilio.sdk.resource.instance.pricing.VoiceNumber;

public class Example {

	// Find your Account Sid and Token at twilio.com/user/account
	public static final String ACCOUNT_SID = "ACXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX";
	public static final String AUTH_TOKEN = "your_auth_token";

	public static void main(String[] args) throws TwilioRestException {
		TwilioPricingClient client = new TwilioPricingClient(ACCOUNT_SID, AUTH_TOKEN);

		// Get Twilio Voice pricing for calls to/from a specific number
		VoiceNumber n = client.getVoiceNumber("+15108675310");

		System.out.println(n.getOutboundCallPrice().getCurrentPrice().toString());
	}
}
