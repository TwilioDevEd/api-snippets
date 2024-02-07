import com.twilio.Twilio;
import com.twilio.rest.wireless.v1.Command;

public class Example {
    // Get your Account SID and Auth Token from https://twilio.com/console
    // To set up environment variables, see http://twil.io/secure
    public static final String ACCOUNT_SID = System.getenv("TWILIO_ACCOUNT_SID");
    public static final String AUTH_TOKEN = System.getenv("TWILIO_AUTH_TOKEN");

    public static void main(String[] args) {
        // Initialize the client
        Twilio.init(ACCOUNT_SID, AUTH_TOKEN);

        Command command = Command
                .creator("SGVsbG8sIE1hY2hpbmUh==")
                .setSim("AliceSmithSmartMeter")
                .setCommandMode(Command.CommandMode.forValue("binary"))
                .create();

        System.out.println(command);
    }
}
