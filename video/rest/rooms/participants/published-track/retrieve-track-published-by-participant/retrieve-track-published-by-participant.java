import com.twilio.Twilio;
import com.twilio.rest.video.v1.room.participant.PublishedTrack;

public class PublishedTrackExample1 {
    public static final String API_KEY_SID = System.getenv("TWILIO_API_KEY_SID");;
    public static final String API_KEY_SECRET = System.getenv("TWILIO_API_KEY_SECRET");

    public static void main(String args[]) {
        Twilio.init(API_KEY_SID, API_KEY_SECRET);

        PublishedTrack publishedTrack = PublishedTrack.fetcher(
                "DailyStandup",
                "Alice",
                "Camera").fetch();

        System.out.println(publishedTrack.getSid());
    }
}
