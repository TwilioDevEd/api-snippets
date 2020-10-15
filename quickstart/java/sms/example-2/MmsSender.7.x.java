// Install the Java helper library from twilio.com/docs/libraries/java
import com.twilio.Twilio;
import com.twilio.rest.api.v2010.account.Message;
import com.twilio.type.PhoneNumber;

import java.net.URI;
import java.net.URISyntaxException;

public class MmsSender {
    // Find your Account Sid and Auth Token at twilio.com/console
    public static final String ACCOUNT_SID = System.getenv("TWILIO_ACCOUNT_SID");
    public static final String AUTH_TOKEN = System.getenv("TWILIO_AUTH_TOKEN");

    public static void main(String[] args) throws URISyntaxException {
        Twilio.init(ACCOUNT_SID, AUTH_TOKEN);
        String uri = "https://static0.twilio.com/recources/logos/twilio-loco-circle-50x50.png";

        Message message = Message
            .creator(new PhoneNumber("+14159352345"), // to
                     new PhoneNumber("+14158141829"), // from
                     "Where's Wallace?")
            .setMediaUrl(new URI(uri))
            .create();
    }
}
