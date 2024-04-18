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
    com.twilio.rest.media.v1.playerstreamer.PlaybackGrant playbackGrant =
        com.twilio.rest.media.v1.playerstreamer.PlaybackGrant.creator("VJ3f3dc19da15af020bb395f0487f5221d")
        .setTtl(60)
        .create();

    // Wrap the grant you received from the API
    // in a PlaybackGrant object
    PlaybackGrant wrappedPlaybackGrant = new PlaybackGrant().setGrant(playbackGrant.getGrant());

    // Create an Access Token and add the PlaybackGrant to it
    AccessToken token = new AccessToken.Builder(
      twilioAccountSid,
      twilioApiKey,
      twilioApiSecret
    ).grant(wrappedPlaybackGrant).build();

    System.out.println(token.toJwt());
  }
}
