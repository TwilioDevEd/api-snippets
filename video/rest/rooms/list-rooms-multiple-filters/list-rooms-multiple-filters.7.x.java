import com.twilio.Twilio;
import com.twilio.base.ResourceSet;
import com.twilio.rest.video.v1.Room;
import com.twilio.rest.video.v1.Room.RoomStatus;

public class Example {
    // Find your Account Sid and Token at twilio.com/console
    public static final String ACCOUNT_SID = "ACXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX";
    public static final String AUTH_TOKEN = "your_auth_token";

    public static void main(String args[]) {
        // Initialize the client
        Twilio.init(ACCOUNT_SID, AUTH_TOKEN);

        ResourceSet<Room> rooms = Room.reader().setStatus(RoomStatus.COMPLETED)
                .setUniqueName("DailyStandup").read();

        // Loop over rooms and print out a property for each one.
        for (Room room : rooms) {
            System.out.println(room.getSid());
        }
    }
}
