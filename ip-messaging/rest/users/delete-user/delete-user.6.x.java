import com.twilio.sdk.TwilioIPMessagingClient;
import com.twilio.sdk.resource.instance.ipmessaging.Service;
import com.twilio.sdk.resource.instance.ipmessaging.User;
import com.twilio.sdk.resource.list.ipmessaging.ServiceList;
import com.twilio.sdk.resource.list.ipmessaging.UserList;
import com.twilio.sdk.TwilioRestException;
import java.util.HashMap;
import java.util.Map;

public class TwilioTest {
    // Find your Account Sid and Token at twilio.com/user/account
    public static final String ACCOUNT_SID = "ACXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX";
    public static final String AUTH_TOKEN = "your_auth_token";

    public static final String SERVICE_SID = "ISXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX";
    public static final String USER_SID = "USXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX";

    public static void main(String args[]) throws TwilioRestException {
        // Initialize the client
        TwilioIPMessagingClient client = new TwilioIPMessagingClient(ACCOUNT_SID, AUTH_TOKEN);

        // Retrieve the service
        Service service = client.getService(SERVICE_SID);

        // Delete the user
        final Map<String, String> userParams = new HashMap<String, String>();
        userParams.put("sid", "new_sid");
        User user = service.getUser(USER_SID);
        boolean didDelete = user.delete();
        System.out.println(didDelete);
    }
}
