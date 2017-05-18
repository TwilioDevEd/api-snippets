// Install the Java helper library from twilio.com/docs/libraries/java

import com.twilio.Twilio;
import com.twilio.rest.sync.v1.service.document.DocumentPermission;

import java.net.URISyntaxException;

public class Example {
    // Find your Account Sid and Token at twilio.com/console
    public static final String ACCOUNT_SID = "ACXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX";
    public static final String AUTH_TOKEN = "your_auth_token";

    public static void main(String[] args) throws URISyntaxException {
        Twilio.init(ACCOUNT_SID, AUTH_TOKEN);

        String serviceSid = "ISXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX";
        String documentSid = "MyFirstDocument";
        String identity = "bob";

        DocumentPermission documentPermission = DocumentPermission
                .fetcher(serviceSid, documentSid, identity)
                .fetch();

        System.out.println(documentPermission);
    }
}
