// Install the Java helper library from twilio.com/docs/java/install
import com.twilio.sdk.TwilioRestClient;
import com.twilio.sdk.TwilioRestException;
import com.twilio.sdk.resource.factory.TokenFactory;
import com.twilio.sdk.resource.instance.Token;
import java.util.ArrayList;
import org.apache.http.NameValuePair;

public class Example {

  // Find your Account Sid and Token at twilio.com/user/account
  public static final String ACCOUNT_SID = "ACXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX";
  public static final String AUTH_TOKEN = "your_auth_token";

  public static void main(String[] args) throws TwilioRestException {
    TwilioRestClient client = new TwilioRestClient(ACCOUNT_SID, AUTH_TOKEN);

    TokenFactory tokenFactory = client.getAccount().getTokenFactory();
    Token token = tokenFactory.create(new ArrayList<NameValuePair>());
    System.out.println(token.getUsername());
  }
}