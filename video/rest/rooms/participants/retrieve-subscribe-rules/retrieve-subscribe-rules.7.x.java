// Install the Java helper library from twilio.com/docs/java/install
import com.twilio.Twilio;
import com.twilio.rest.video.v1.room.participant.SubscribeRules;
import com.twilio.rest.video.v1.Room.Participants;
import java.util.Map;

public class FetchSubscribeRules{

  // Find your credentials at twilio.com/console
  // To set up environment variables, see http://twil.io/secure
  public static final String ACCOUNT_SID = System.getenv("TWILIO_ACCOUNT_SID");
  public static final String API_KEY_SID = System.getenv("TWILIO_API_KEY_SID");
  public static final String API_KEY_SECRET = System.getenv("TWILIO_API_KEY_SECRET");

  public static void main( String[] args ) throws IOException{
      // Initialize the client
      Twilio.init(API_KEY_SID, API_KEY_SECRET, ACCOUNT_SID);

      SubscribeRules subscribeRules = SubscribedRules.fetcher(
        "RMXXXX",
        "PAXXXX"
      ).fetch();

      for (Map<String, Object> rule : subscribeRules.getRules()) {
			     System.out.println("Read rule with type = " + rule.get("type").toString());
		  }
  }
}
