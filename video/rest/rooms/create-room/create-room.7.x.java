import com.twilio.Twilio;
import com.twilio.rest.video.v1.Room;

public class Example {
    // Find your Account Sid and Token at twilio.com/console
    public static final String ACCOUNT_SID = "ACXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX";
    public static final String AUTH_TOKEN = "your_auth_token";

    public static void main(String args[]) {
        // Initialize the client
        Twilio.init(ACCOUNT_SID, AUTH_TOKEN);

        Room room = Room.creator().setUniqueName("DailyStandup").create();

        System.out.println(room.getSid());
    }

}
