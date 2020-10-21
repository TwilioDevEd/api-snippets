// Download the helper library from https://www.twilio.com/docs/java/install
import com.twilio.Twilio;
import com.twilio.rest.autopilot.v1.assistant.task.Sample;

public class Example {
    // Your Account Sid and Auth Token from twilio.com/console
    public static final String ACCOUNT_SID = System.getenv("TWILIO_ACCOUNT_SID");
    public static final String AUTH_TOKEN = System.getenv("TWILIO_AUTH_TOKEN");

    public static String[] phrases = {
        "Tell me a joke",
        "Tell me a joke",
        "I'd like to hear a joke",
        "Do you know any good jokes?",
        "Joke",
        "Tell joke",
        "Tell me something funny",
        "Make me laugh",
        "I want to hear a joke",
        "Can I hear a joke?",
        "I like jokes",
        "I'd like to hear a punny joke"
    };

    public static void main(String[] args) {
        Twilio.init(ACCOUNT_SID, AUTH_TOKEN);

        // Replace 'UAXXX...' with your Assistant's unique SID https://www.twilio.com/console/autopilot/list
        for (String phrase:phrases) {
            Sample sample = Sample.creator(
                    "UAXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX",
                    "UDXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX",
                    "en-US",
                    phrase)
                .create();
            System.out.println(sample.getSid());
        }
    }
}
