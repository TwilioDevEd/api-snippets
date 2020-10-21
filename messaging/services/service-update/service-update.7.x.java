import com.twilio.Twilio;
import com.twilio.rest.messaging.v1.Service;

public class Example {
    // Get your Account SID and Auth Token from https://twilio.com/console
    // To set up environment variables, see http://twil.io/secure
    public static final String ACCOUNT_SID = System.getenv("TWILIO_ACCOUNT_SID");
    public static final String AUTH_TOKEN = System.getenv("TWILIO_AUTH_TOKEN");

    public static void main(String[] args) {
        // Initialize the client
        Twilio.init(ACCOUNT_SID, AUTH_TOKEN);

        Service service = Service.updater("MG2172dd2db502e20dd981ef0d67850e1a")
                .setInboundRequestUrl("http://www.example.com")
                .update();
    }
}
