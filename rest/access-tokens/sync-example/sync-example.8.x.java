import com.twilio.jwt.accesstoken.AccessToken;
import com.twilio.jwt.accesstoken.SyncGrant;

public class TokenGenerator {
  
  public static void main(String[] args) {
    // Get your Account SID from https://twilio.com/console
    // To set up environment variables, see http://twil.io/secure
    // Required for all types of tokens
    String twilioAccountSid = System.getenv("TWILIO_ACCOUNT_SID");
    String twilioApiKey = System.getenv("TWILIO_API_KEY");
    String twilioApiSecret = System.getenv("TWILIO_API_SECRET");
    String twilioSyncService = System.getenv("TWILIO_SYNC_SERVICE_SID");


    // Required for Sync
    String identity = "user";
      
    // Create Sync grant
    SyncGrant grant = new SyncGrant();

    // Create a "grant" which enables a client to use Sync as a given user
    grant.setServiceSid(twilioSyncService);

    // Create access token
    AccessToken token = new AccessToken.Builder(
      twilioAccountSid,
      twilioApiKey,
      twilioApiSecret
    ).identity(identity).grant(grant).build();

    System.out.println(token.toJwt());
  }
}
