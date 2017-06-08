import com.twilio.sdk.TwilioIPMessagingClient;
import com.twilio.sdk.resource.instance.ipmessaging.Service;
import com.twilio.sdk.TwilioRestException;

import java.util.HashMap;
import java.util.Map;

public class TwilioTest {
    // Find your Account Sid and Token at twilio.com/user/account
    public static final String ACCOUNT_SID = "ACXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX";
    public static final String AUTH_TOKEN = "your_auth_token";
    public static final String SERVICE_SID = "ISXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX";

    public static void main(String args[]) throws TwilioRestException {
        // Initialize the client
        TwilioIPMessagingClient client = new TwilioIPMessagingClient(ACCOUNT_SID, AUTH_TOKEN);

        // Retrieve the service
        Service service = client.getService(SERVICE_SID);

        // Update the service
        final Map<String, String> serviceParams = new HashMap<String, String>();
        serviceParams.put("FriendlyName", "NewServiceName");
        service.update(serviceParams);
        System.out.println(service);
    }
}
