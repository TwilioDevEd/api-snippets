import com.twilio.Twilio;
import com.twilio.rest.video.v1.Recording;


public class Example {
    // Find your Account Sid and Token at twilio.com/console
    public static final String API_KEY_SID = "SKXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX";
    public static final String API_KEY_SECRET = "your_api_key_secret";

    public static void main(String args[]) {

        // Initialize the client
        Twilio.init(API_KEY_SID, API_KEY_SECRET);

        Recording recording = Recording.fetcher("RTXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX")
                .fetch();

        System.out.println(recording.getType());
    }
}
