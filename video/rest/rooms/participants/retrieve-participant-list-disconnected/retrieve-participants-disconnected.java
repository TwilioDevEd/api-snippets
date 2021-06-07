import com.twilio.Twilio;
import com.twilio.base.ResourceSet;
import com.twilio.rest.video.v1.room.Participant;

public class ParticipantsExample3 {

    public static final String API_KEY_SID = System.getenv("TWILIO_API_KEY_SID");;
    public static final String API_KEY_SECRET = System.getenv("TWILIO_API_KEY_SECRET");

    public static void main(String args[]) {
        Twilio.init(API_KEY_SID, API_KEY_SECRET);

        ResourceSet<Participant> participants = Participant.reader("RMXXXXXXXXXXXXXXXXXXXXXXXXXXXXX")
                .setStatus(Participant.Status.DISCONNECTED)
                .read();

        for (Participant participant : participants) {
            System.out.println(participant.getSid());
        }
    }
}
