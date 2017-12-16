// NOTE: This example uses the next generation Twilio helper library - for more
// information on how to download and install this version, visit
// https://www.twilio.com/docs/libraries/java
import com.twilio.Twilio;
import com.twilio.rest.notify.v1.Service;

public class Example {
    // Find your Account Sid and Token at twilio.com/user/account
    public static final String ACCOUNT_SID = "ACXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX";
    public static final String AUTH_TOKEN = "your_auth_token";

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
