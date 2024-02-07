import com.twilio.jwt.accesstoken.AccessToken;
import com.twilio.jwt.accesstoken.ChatGrant;

public class Example {
  public static void main(String[] args) {
    // Get your Account SID from https://twilio.com/console
    // To set up environment variables, see http://twil.io/secure
    // Required for all types of tokens
    String twilioAccountSid = System.getenv("TWILIO_ACCOUNT_SID");
    String twilioApiKey = System.getenv("TWILIO_API_KEY");
    String twilioApiSecret = System.getenv("TWILIO_API_SECRET");

    String serviceSid = System.getenv("TWILIO_SERVICE_SID");
    String pushCredentialSid = System.getenv("TWILIO_PUSH_CREDENTIAL_SID");
    String identity = "user@example.com";

    ChatGrant grant = new ChatGrant();
    grant.setServiceSid(serviceSid);
    grant.setPushCredentialSid(pushCredentialSid);

    AccessToken token = new AccessToken.Builder(twilioAccountSid, twilioApiKey, twilioApiSecret)
        .identity(identity).grant(grant).build();

    System.out.println(token.toJwt());
  }
}
