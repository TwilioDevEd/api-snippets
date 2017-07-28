import com.twilio.Twilio;
import com.twilio.rest.wireless.v1.Command;

public class Example {
    // Find your Account Sid and Token at twilio.com/console
    public static final String ACCOUNT_SID = "ACXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX";
    public static final String AUTH_TOKEN = "your_auth_token";

    public static void main(String[] args) {
        // Initialize the client
        Twilio.init(ACCOUNT_SID, AUTH_TOKEN);

        Command command = Command
                .creator("SGVsbG8sIE1hY2hpbmUh==")
                .setCommandMode("binary")
                .setCallbackUrl("https://sim-manager.mycompany.com/commands/mobile-terminated-command-callback")
                .create();

        System.out.println(command);
    }
}
