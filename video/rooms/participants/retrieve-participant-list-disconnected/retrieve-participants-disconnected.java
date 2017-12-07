import com.twilio.Twilio;
import com.twilio.base.ResourceSet;
import com.twilio.rest.video.v1.room.Participant;

public class ParticipantsExample3 {

	public static final String API_KEY_SID = "SKXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX";
	public static final String API_KEY_SECRET = "your_api_key_secret";

	public static void main(String args[]) {
		Twilio.init(API_KEY_SID, API_KEY_SECRET);

		ResourceSet<Participant> participants = Participant.reader("RMXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX")
				.setStatus(Participant.Status.DISCONNECTED)
				.read();

		for (Participant participant : participants) {
			System.out.println(participant.getIdentity());
		}
	}
}
