import com.twilio.Twilio;
import com.twilio.base.ResourceSet;
import com.twilio.rest.video.v1.Recording;
import java.util.Arrays;

public class Example {
    // Find your Account Sid and Token at twilio.com/console
    public static final String API_KEY_SID = "SKXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX";
    public static final String API_KEY_SECRET = "your_api_key_secret";

    public static void main(String args[]) {

        // Initialize the client
        Twilio.init(API_KEY_SID, API_KEY_SECRET);

        String roomSid = "RMXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX";
        String participantSid = "ParticipantSid";

        ResourceSet<Recording> recordings = Recording.reader()
                .setGroupingSid(Arrays.asList(roomSid, participantSid))
                .read();

        // Loop over rooms and print out a property for each one.
        for (Recording recording : recordings) {
            System.out.println(recording.getSid());
        }
    }
}
