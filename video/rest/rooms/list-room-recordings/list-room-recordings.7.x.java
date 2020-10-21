import com.twilio.Twilio;
import com.twilio.base.ResourceSet;
import com.twilio.rest.video.v1.room.RoomRecording;

public class Example {
    // Get your Account SID and Auth Token from https://twilio.com/console
    // To set up environment variables, see http://twil.io/secure
    public static final String API_KEY_SID = System.getenv("TWILIO_API_KEY_SID");;
    public static final String API_KEY_SECRET = System.getenv("TWILIO_API_KEY_SECRET");

    public static void main(String args[]) {
        // Initialize the client
        Twilio.init(API_KEY_SID, API_KEY_SECRET);

        ResourceSet<RoomRecording> roomRecordings = RoomRecording
                .reader("RMXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX").read();

        for (RoomRecording roomRecording : roomRecordings) {
            System.out.println(roomRecording.getSid());
        }

    }
}
