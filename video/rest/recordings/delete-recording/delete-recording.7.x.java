import com.twilio.Twilio;
import com.twilio.rest.api.v2010.account.Recording;

public class Example {

    // Find your Account Sid and Token at twilio.com/console
    public static final String API_KEY_SID = "SKXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX";
    public static final String API_KEY_SECRET = "your_api_key_secret";

    public static void main(String args[]) {

        // Initialize the client
        Twilio.init(API_KEY_SID, API_KEY_SECRET);

        boolean didDelete = Recording.deleter("RTXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX")
            .delete();

        System.out.println(didDelete);
    }
}
