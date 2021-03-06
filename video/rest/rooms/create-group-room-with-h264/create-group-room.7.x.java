import com.twilio.Twilio;
import com.twilio.rest.video.v1.Room;
import com.twilio.rest.video.v1.Room.RoomType;

public class Example {
    // Get your Account SID and Auth Token from https://twilio.com/console
    // To set up environment variables, see http://twil.io/secure
    public static final String API_KEY_SID = System.getenv("TWILIO_API_KEY_SID");;
    public static final String API_KEY_SECRET = System.getenv("TWILIO_API_KEY_SECRET");

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
