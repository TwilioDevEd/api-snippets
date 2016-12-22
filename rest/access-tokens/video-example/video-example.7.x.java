import com.twilio.jwt.accesstoken.AccessToken;
import com.twilio.jwt.accesstoken.VideoGrant;

public class TokenGenerator {
  
  public static void main(String[] args) {
    // Required for all types of tokens
    String twilioAccountSid = "ACxxxxxxxxxxxx";
    String twilioApiKey = "SKxxxxxxxxxxxx";
    String twilioApiSecret = "xxxxxxxxxxxxxx";

    // Required for Video
    String configurationProfileSid = "VSxxxxxxxxxxxx";
    String identity = "user";
      
    // Create Video grant
    VideoGrant grant = new VideoGrant();
    grant.setConfigurationProfileSid(configurationProfileSid);
    
    // Create access token
    AccessToken token = new AccessToken.Builder(
      twilioAccountSid,
      twilioApiKey,
      twilioApiSecret
    ).identity(identity).grant(grant).build();

    System.out.println(token.toJwt());
  }
}
