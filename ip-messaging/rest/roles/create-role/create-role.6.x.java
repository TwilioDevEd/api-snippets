import com.twilio.sdk.TwilioRestException;
import com.twilio.sdk.resource.instance.ipmessaging.Role;
import com.twilio.sdk.TwilioIPMessagingClient;
import com.twilio.sdk.resource.instance.ipmessaging.Service;
import org.apache.http.NameValuePair;
import org.apache.http.message.BasicNameValuePair;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

public class TwilioTest {
    // Find your Account Sid and Token at twilio.com/user/account
    public static final String ACCOUNT_SID = "ACXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX";
    public static final String AUTH_TOKEN = "your_auth_token";
    public static final String SERVICE_SID = "ISXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX";

    public static void main(String args[]) throws TwilioRestException {
        // Initialize the client
        TwilioIPMessagingClient client = new TwilioIPMessagingClient(ACCOUNT_SID, AUTH_TOKEN);
        Service service = client.getService(SERVICE_SID);

        // Create a role
        final List<NameValuePair> roleParams = new ArrayList<NameValuePair>();
        roleParams.add(new BasicNameValuePair("FriendlyName", "RoleName"));
        roleParams.add(new BasicNameValuePair("Type", "deployment"));
        roleParams.add(new BasicNameValuePair("Permission", "createChannel"));
        roleParams.add(new BasicNameValuePair("Permission", "joinChannel"));

        final Map<String, String> roleparams = new HashMap<String, String>();
        roleparams.put("FriendlyName", "RoleName");
        Role role = service.createRole(roleparams);
        System.out.println(role.toString());
    }
}
