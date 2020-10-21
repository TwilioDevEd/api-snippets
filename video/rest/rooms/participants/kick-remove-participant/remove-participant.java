import com.twilio.Twilio;
import com.twilio.rest.video.v1.room.Participant;

public class ParticipantsExample2 {
    public static final String API_KEY_SID = System.getenv("TWILIO_API_KEY_SID");;
    public static final String API_KEY_SECRET = System.getenv("TWILIO_API_KEY_SECRET");

    public static void main(String args[]) {
        Twilio.init(API_KEY_SID, API_KEY_SECRET);

        Participant participant = Participant
                .updater("DailyStandup", "Alice")
                .setStatus(Participant.Status.DISCONNECTED)
                .update();

        System.out.println(participant.getStatus());
    }
}
