import com.twilio.Twilio;
import com.twilio.rest.video.v1.room.participant.PublishedTrack;

public class PublishedTrackExample1 {
	public static final String API_KEY_SID = "SKXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX";
	public static final String API_KEY_SECRET = "your_api_key_secret";

	public static void main(String args[]) {
		Twilio.init(API_KEY_SID, API_KEY_SECRET);

		PublishedTrack publishedTrack = PublishedTrack.fetcher(
				"DailyStandup",
				"Alice",
				"Camera").fetch();

		System.out.println(publishedTrack.getSid());
	}
}
