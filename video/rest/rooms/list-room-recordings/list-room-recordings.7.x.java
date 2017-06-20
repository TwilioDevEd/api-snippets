import com.twilio.Twilio;
import com.twilio.base.ResourceSet;
import com.twilio.rest.video.v1.room.RoomRecording;

public class Example {
    // Find your Account Sid and Token at twilio.com/console
    public static final String ACCOUNT_SID = "ACXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX";
    public static final String AUTH_TOKEN = "your_auth_token";

    public static void main(String args[]) {
        // Initialize the client
        Twilio.init(ACCOUNT_SID, AUTH_TOKEN);

        ResourceSet<RoomRecording> roomRecordings = RoomRecording
                .reader("RMXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX").read();

        for (RoomRecording roomRecording : roomRecordings) {
            System.out.println(roomRecording.getSid());
        }

    }
}
