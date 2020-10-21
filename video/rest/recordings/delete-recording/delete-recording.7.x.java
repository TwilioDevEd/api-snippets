import com.twilio.Twilio;
import com.twilio.rest.api.v2010.account.Recording;

public class Example {

    // Get your Account SID and Auth Token from https://twilio.com/console
    // To set up environment variables, see http://twil.io/secure
    public static final String API_KEY_SID = System.getenv("TWILIO_API_KEY_SID");;
    public static final String API_KEY_SECRET = System.getenv("TWILIO_API_KEY_SECRET");

    public static void main(String args[]) {

        // Initialize the client
        Twilio.init(API_KEY_SID, API_KEY_SECRET);

        boolean didDelete = Recording.deleter("RTXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX")
            .delete();

        System.out.println(didDelete);
    }
}
