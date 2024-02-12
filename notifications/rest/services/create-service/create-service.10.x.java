// NOTE: This example uses the next generation Twilio helper library - for more
// information on how to download and install this version, visit
// https://www.twilio.com/docs/libraries/java
import com.twilio.Twilio;
import com.twilio.rest.notify.v1.Service;

public class Example {
    // Get your Account SID and Auth Token from https://twilio.com/console
    // To set up environment variables, see http://twil.io/secure
    public static final String ACCOUNT_SID = System.getenv("TWILIO_ACCOUNT_SID");
    public static final String AUTH_TOKEN = System.getenv("TWILIO_AUTH_TOKEN");

    public static final String APN_CREDENTIAL_SID = "CRXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX";
    public static final String FCM_CREDENTIAL_SID = "CRXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX";

    public static void main(String[] args) {
        // Initialize the client
        Twilio.init(ACCOUNT_SID, AUTH_TOKEN);

        // Create the service
        Service service = Service.creator()
                .setFriendlyName("My Awesome Service")
                .setApnCredentialSid(APN_CREDENTIAL_SID)
                .setFcmCredentialSid(FCM_CREDENTIAL_SID)
                .create();

        System.out.println(service.getFriendlyName());
    }
}
