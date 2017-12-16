import com.twilio.Twilio;
import com.twilio.rest.video.v1.Room;
import com.twilio.rest.video.v1.Room.RoomType;

public class Example {
    // Find your Account Sid and Token at twilio.com/console
    public static final String API_KEY_SID = "SKXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX";
    public static final String API_KEY_SECRET = "your_api_key_secret";

    public static void main(String args[]) {
        // Initialize the client
        Twilio.init(API_KEY_SID, API_KEY_SECRET);

        Room room = Room.creator()
                .setUniqueName("DailyStandupWithH264Codec")
                .setType(RoomType.GROUP)
                .setVideoCodecs(Room.VideoCodec.forValue("H264"))
                .setStatusCallback("http://example.org")
                .create();

        System.out.println(room.getSid());
    }
}
