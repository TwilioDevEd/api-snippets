import com.twilio.sdk.TwilioIPMessagingClient;
import com.twilio.sdk.resource.instance.sip.Credential;
import com.twilio.sdk.resource.list.ipmessaging.CredentialList;
import com.twilio.sdk.TwilioRestException;

public class TwilioTest {
    // Find your Account Sid and Token at twilio.com/user/account
    public static final String ACCOUNT_SID = "ACXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX";
    public static final String AUTH_TOKEN = "your_auth_token";
    public static final String SERVICE_SID = "ISXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX";

    public static void main(String args[]) throws TwilioRestException {
        // Initialize the client
        TwilioIPMessagingClient client = new TwilioIPMessagingClient(ACCOUNT_SID, AUTH_TOKEN);

        // Retrieve the list of credentials
        CredentialList list = client.getCredentials();
        System.out.println(list);
    }
}
