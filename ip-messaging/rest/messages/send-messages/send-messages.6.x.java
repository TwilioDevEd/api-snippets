import com.twilio.sdk.TwilioIPMessagingClient;
import com.twilio.sdk.TwilioRestException;
import com.twilio.sdk.resource.instance.ipmessaging.Service;
import com.twilio.sdk.resource.instance.ipmessaging.Channel;
import com.twilio.sdk.resource.instance.ipmessaging.Message;

import java.util.HashMap;
import java.util.Map;

public class TwilioTest {
    // Find your Account Sid and Token at twilio.com/user/account
    public static final String ACCOUNT_SID = "ACXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX";
    public static final String AUTH_TOKEN = "your_auth_token";

    public static final String SERVICE_SID = "ISXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX";
    public static final String CHANNEL_SID = "CHXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX";
    public static final String MEMBER_SID = "MBXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX";

    public static void main(String args[]) throws TwilioRestException {
        // Initialize the client
        TwilioIPMessagingClient client = new TwilioIPMessagingClient(ACCOUNT_SID, AUTH_TOKEN);

        // Retrieve the channel
        Service service = client.getService(SERVICE_SID);
        Channel channel = service.getChannel(CHANNEL_SID);

        // Create the message
        final Map<String, String> messageParams = new HashMap<String, String>();
        messageParams.put("Body", "MESSAGE");
        Message message = channel.getMessages().create(messageParams);
        System.out.println(message);
    }
}
