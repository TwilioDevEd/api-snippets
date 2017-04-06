import com.twilio.jwt.accesstoken.AccessToken;
import com.twilio.jwt.accesstoken.VoiceGrant;

public class TokenGenerator {
  
  public static void main(String[] args) {
    // Required for all types of tokens
    String twilioAccountSid = "ACxxxxxxxxxxxx";
    String twilioApiKey = "SKxxxxxxxxxxxx";
    String twilioApiSecret = "xxxxxxxxxxxxxx";

    // Required for Voice
    String outgoingApplicationSid = "APxxxxxxxxxxxx";
    String pushCredentialSid = "CRxxxxxxxxxxxx";
    String identity = "user";
      
    // Create Voice grant
    VoiceGrant grant = new VoiceGrant();
    grant.setOutgoingApplicationSid(outgoingApplicationSid);
    grant.setPushCredentialSid(pushCredentialSid);
    
    // Create access token
    AccessToken token = new AccessToken.Builder(
      twilioAccountSid,
      twilioApiKey,
      twilioApiSecret
    ).identity(identity).grant(grant).build();

    System.out.println(token.toJwt());
  }
}
