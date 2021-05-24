// Install the Java helper library from twilio.com/docs/libraries/java
import com.twilio.Twilio;
import com.twilio.rest.fax.v1.Fax;
import com.twilio.rest.fax.v1.FaxCreator;
import java.net.URI;
import java.net.URISyntaxException;

public class Example {
    // Get your Account SID and Auth Token from https://twilio.com/console
    // To set up environment variables, see http://twil.io/secure
    public static final String ACCOUNT_SID = System.getenv("TWILIO_ACCOUNT_SID");
    public static final String AUTH_TOKEN = System.getenv("TWILIO_AUTH_TOKEN");

    public static void main(String[] args) throws URISyntaxException {
        Twilio.init(ACCOUNT_SID, AUTH_TOKEN);

        String from = "+15017122661";
        String to = "+15558675310";
        URI mediaUrl = new URI("https://www.twilio.com/docs/documents/25/justthefaxmaam.pdf");
        FaxCreator faxCreator = Fax.creator(to, mediaUrl);
        faxCreator.setFrom(from);
        Fax fax = faxCreator.create();

        System.out.println(fax.getSid());
    }
}
