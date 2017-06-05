import com.twilio.sdk.TwilioIPMessagingClient;
import com.twilio.sdk.resource.instance.ipmessaging.Service;
import com.twilio.sdk.TwilioRestException;

import java.util.HashMap;
import java.util.Map;

public class TwilioTest {
    // Find your Account Sid and Token at twilio.com/user/account
    public static final String ACCOUNT_SID = "ACXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX";
    public static final String AUTH_TOKEN = "your_auth_token";

    public static void main(String args[]) throws TwilioRestException {
        // Initialize the client
        TwilioIPMessagingClient client = new TwilioIPMessagingClient(ACCOUNT_SID, AUTH_TOKEN);

        // Create the service
        final Map<String, String> serviceParams = new HashMap<String, String>();
        serviceParams.put("FriendlyName", "ServiceName");
        Service service = client.getServices().create(serviceParams);
        System.out.println(service);
    }
}
