import com.twilio.sdk.resource.instance.ipmessaging.Role;
import com.twilio.sdk.resource.list.ipmessaging.RoleList;
import com.twilio.sdk.TwilioIPMessagingClient;
import com.twilio.sdk.resource.instance.ipmessaging.Service;

public class TwilioTest {
    // Find your Account Sid and Token at twilio.com/user/account
    public static final String ACCOUNT_SID = "ACCOUNT_SID";
    public static final String AUTH_TOKEN = "AUTH_TOKEN";
    public static final String SERVICE_SID = "SERVICE_SID";

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