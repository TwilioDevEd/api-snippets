import com.twilio.Twilio;
import com.twilio.rest.video.v1.room.Participant;
public class ParticipantsExample1 {
	public static final String API_KEY_SID = "SKXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX";
	public static final String API_KEY_SECRET = "your_api_key_secret";
	
	public static void main(String args[]) {
		Twilio.init(API_KEY_SID, API_KEY_SECRET);
		
		Participant participant = Participant.fetcher("RMXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX", "Alice").fetch();
	}
}