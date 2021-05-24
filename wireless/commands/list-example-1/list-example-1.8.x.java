import com.twilio.Twilio;
import com.twilio.base.ResourceSet;
import com.twilio.rest.wireless.v1.Command;

public class Example {
    // Get your Account SID and Auth Token from https://twilio.com/console
    // To set up environment variables, see http://twil.io/secure
    public static final String ACCOUNT_SID = System.getenv("TWILIO_ACCOUNT_SID");
    public static final String AUTH_TOKEN = System.getenv("TWILIO_AUTH_TOKEN");

    public static void main(String[] args) {
        // Initialize the client
        Twilio.init(ACCOUNT_SID, AUTH_TOKEN);

        ResourceSet<Command> commands = Command.reader().read();

        for (Command command : commands) {
            System.out.println(command);
        }
    }
}
