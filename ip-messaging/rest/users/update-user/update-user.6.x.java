import com.twilio.sdk.TwilioIPMessagingClient;
import com.twilio.sdk.resource.instance.ipmessaging.Service;
import com.twilio.sdk.resource.instance.ipmessaging.User;
import com.twilio.sdk.resource.list.ipmessaging.ServiceList;
import com.twilio.sdk.resource.list.ipmessaging.UserList;

public class TwilioTest {
    // Find your Account Sid and Token at twilio.com/user/account
    public static final String ACCOUNT_SID = "ACCOUNT_SID";
    public static final String AUTH_TOKEN = "AUTH_TOKEN";

    public static final String SERVICE_SID = "SERVICE_SID";
    public static final String USER_SID = "USER_SID";

    public static void main(String args[]) throws TwilioRestException {
        // Initialize the client
        TwilioIPMessagingClient client = new TwilioIPMessagingClient(ACCOUNT_SID, AUTH_TOKEN);

        // Retrieve the service
        Service service = client.getService(SERVICE_SID);

        // Update the user
        final Map<String, String> userParams = new HashMap<String, String>();
        userParams.put("RoleSid", "new_role_sid");
        User user = service.getUser(USER_SID);
        user.update(userParams);
        System.out.println(user);
    }
}