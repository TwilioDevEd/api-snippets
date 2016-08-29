import com.twilio.sdk.TwilioIPMessagingClient;
import com.twilio.sdk.resource.instance.ipmessaging.Service;
import com.twilio.sdk.resource.list.ipmessaging.ServiceList;

public class TwilioTest {
    // Find your Account Sid and Token at twilio.com/user/account
    public static final String ACCOUNT_SID = "ACCOUNT_SID";
    public static final String AUTH_TOKEN = "AUTH_TOKEN";
    public static final String SERVICE_SID = "SERVICE_SID";

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