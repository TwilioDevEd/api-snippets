import com.twilio.sdk.resource.instance.ipmessaging.Channel;
import com.twilio.sdk.resource.list.ipmessaging.ChannelList;
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

        // Create the parameters
        final Map<String, String> channelParams = new HashMap<String, String>();
        channelParams.put("FriendlyName", "General");
        channelParams.put("UniqueName", "General");

        // Create the channel
        Channel channel = service.createChannel(channelParams);
        System.out.println(channel.toString());
    }
}