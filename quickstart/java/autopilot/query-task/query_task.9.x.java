// Download the helper library from https://www.twilio.com/docs/java/install
import com.twilio.Twilio;
import com.twilio.rest.autopilot.v1.assistant.Query;

public class Example {
    // Your Account Sid and Auth Token from twilio.com/console
    public static final String ACCOUNT_SID = System.getenv("TWILIO_ACCOUNT_SID");
    public static final String AUTH_TOKEN = System.getenv("TWILIO_AUTH_TOKEN");

    public static void main(String[] args) {
        Twilio.init(ACCOUNT_SID, AUTH_TOKEN);

        // Replace 'UAXXX...' with your Assistant's unique SID https://www.twilio.com/console/autopilot/list
        Query query = Query.creator(
                "UAXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX",
                "en-US",
                "Tell me a joke")
            .create();

        System.out.println(query.getSid());
    }
}
