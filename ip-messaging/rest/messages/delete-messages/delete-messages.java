import com.twilio.sdk.TwilioIPMessagingClient;
import com.twilio.sdk.TwilioRestException;
import com.twilio.sdk.resource.instance.ipmessaging.Service;
import com.twilio.sdk.resource.instance.ipmessaging.Channel;
import com.twilio.sdk.resource.instance.ipmessaging.Message;

public class TwilioTest {
    // Find your Account Sid and Token at twilio.com/user/account
    public static final String ACCOUNT_SID = "ACCOUNT_SID";
    public static final String AUTH_TOKEN = "AUTH_TOKEN";

    public static final String SERVICE_SID = "SERVICE_SID";
    public static final String CHANNEL_ID = "CHANNEL_ID";
    public static final String MESSAGE_ID = "MESSAGE_ID";

    public static void main(String args[]) throws TwilioRestException {
        // Initialize the client
        TwilioIPMessagingClient client = new TwilioIPMessagingClient(ACCOUNT_SID, AUTH_TOKEN);

        // Retrieve the service, channel, and message
        Service service = client.getService(SERVICE_SID);
        Channel channel = service.getChannel(CHANNEL_ID);
        Message message = channel.getMessage(MESSAGE_ID);

        // Delete the message
        boolean didDelete = message.delete();
        System.out.println(didDelete);
    }
}