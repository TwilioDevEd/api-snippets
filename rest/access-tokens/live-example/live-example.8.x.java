import com.twilio.Twilio;
import com.twilio.jwt.accesstoken.AccessToken;
import com.twilio.jwt.accesstoken.PlaybackGrant;

public class TokenGenerator {

  public static void main(String[] args) {
    // Get your Account SID from https://twilio.com/console
    // To set up environment variables, see http://twil.io/secure
    // Required for all types of tokens
    String twilioAccountSid = System.getenv("TWILIO_ACCOUNT_SID");
    String twilioApiKey = System.getenv("TWILIO_API_KEY");
    String twilioApiSecret = System.getenv("TWILIO_API_SECRET");

    // Create a PlaybackGrant resource for a specific PlayerStreamer
    // via the REST API
    Twilio.init(twilioApiKey, twilioApiSecret, twilioAccountSid);
    PlaybackGrant playbackGrant =
        PlaybackGrant.creator("VJXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX")
        .setTtl(60)
        .create();

    // Wrap the grant you received from the API
    // in a PlaybackGrant object and then attach that wrapped
    // grant to your Access Token
    PlaybackGrant wrappedPlaybackGrant = new PlaybackGrant().setGrant(playbackGrant.getGrant());

    // Create access token
    AccessToken token = new AccessToken.Builder(
      twilioAccountSid,
      twilioApiKey,
      twilioApiSecret
    ).grant(grant).build();

    System.out.println(token.toJwt());
  }
}
