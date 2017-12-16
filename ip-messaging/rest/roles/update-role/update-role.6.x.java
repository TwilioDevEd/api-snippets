import com.twilio.sdk.TwilioRestException;
import com.twilio.sdk.resource.instance.ipmessaging.Role;
import com.twilio.sdk.TwilioIPMessagingClient;
import com.twilio.sdk.resource.instance.ipmessaging.Service;
import org.apache.http.NameValuePair;
import org.apache.http.message.BasicNameValuePair;

import java.util.ArrayList;
import java.util.List;

public class TwilioTest {
    // Find your Account Sid and Token at twilio.com/user/account
    public static final String ACCOUNT_SID = "ACXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX";
    public static final String AUTH_TOKEN = "your_auth_token";
    public static final String SERVICE_SID = "ISXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX";

    public static void main(String args[]) throws TwilioRestException {
        // Initialize the client
        TwilioIPMessagingClient client = new TwilioIPMessagingClient(ACCOUNT_SID, AUTH_TOKEN);
        Service service = client.getService(SERVICE_SID);

        // Get the role
        Role role = service.getRole("RLXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX");

        // Update the role
        final List<NameValuePair> roleParams = new ArrayList<NameValuePair>();
        roleParams.add(new BasicNameValuePair("Permission", "sendMessage"));
        roleParams.add(new BasicNameValuePair("Permission", "leaveChannel"));
        role.update(roleParams);
        System.out.println(role.toString());
    }
}
