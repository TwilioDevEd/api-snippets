import com.twilio.Twilio;
import com.twilio.rest.api.v2010.account.Recording;

public class Example {

    // Find your Account Sid and Token at twilio.com/console
    public static final String ACCOUNT_SID = "ACXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX";
    public static final String AUTH_TOKEN = "your_auth_token";

    public static void main(String args[]) {

        // Initialize the client
        Twilio.init(ACCOUNT_SID, AUTH_TOKEN);

        boolean didDelete = Recording.deleter("RTXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX")
            .delete();

        System.out.println(didDelete);
    }
}
