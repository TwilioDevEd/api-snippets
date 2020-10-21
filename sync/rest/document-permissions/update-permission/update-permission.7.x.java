// Install the Java helper library from twilio.com/docs/libraries/java

import com.twilio.Twilio;
import com.twilio.rest.sync.v1.service.document.DocumentPermission;

import java.net.URISyntaxException;

public class Example {
    // Get your Account SID and Auth Token from https://twilio.com/console
    // To set up environment variables, see http://twil.io/secure
    public static final String ACCOUNT_SID = System.getenv("TWILIO_ACCOUNT_SID");
    public static final String AUTH_TOKEN = System.getenv("TWILIO_AUTH_TOKEN");

    public static void main(String[] args) throws URISyntaxException {
        Twilio.init(ACCOUNT_SID, AUTH_TOKEN);

        String serviceSid = System.getenv("TWILIO_SERVICE_SID");;
        String documentSid = "MyFirstDocument";
        String identity = "bob";

        DocumentPermission documentPermission = DocumentPermission
                .updater(serviceSid, documentSid, identity, true, true, false)
                .update();

        System.out.println(documentPermission);
    }
}
