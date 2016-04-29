import com.twilio.sdk.auth.AccessToken;
import java.util.ArrayList;
import java.util.List;
import org.apache.http.NameValuePair;
import org.apache.http.message.BasicNameValuePair;

public class Example {

	// Find your Account Sid and Token at twilio.com/user/account
	public static final String ACCOUNT_SID = "ACXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX";
	public static final String SIGNINGKEY_SID = SID;
	public static final String SIGNINGKEY_SECRET = SECRET;

	public static void main(String[] args) throws TwilioRestException {
		AccessToken token = new AccessToken(SIGNINGKEY_SID, ACCOUNT_SID, SIGNINGKEY_SECRET);
		token.addGrant(new EndpointGrant(ENDPOINT_ADDRESS));
		token.enableNTS();
		System.out.println(token.toJWT());
	}
}
