import com.twilio.sdk.TwilioIPMessagingClient;
import com.twilio.sdk.resource.instance.ipmessaging.Service;
import com.twilio.sdk.resource.instance.ipmessaging.Channel;
import com.twilio.sdk.resource.list.ipmessaging.MemberList;

public class TwilioTest {
    // Find your Account Sid and Token at twilio.com/user/account
    public static final String ACCOUNT_SID = "ACCOUNT_SID";
    public static final String AUTH_TOKEN = "AUTH_TOKEN";
    public static final String SERVICE_SID = "SERVICE_SID";
    public static final String CHANNEL_SID = "CHANNEL_SID";
  
    public static void main(String args[]) throws TwilioRestException {
        // Initialize the client
        TwilioIPMessagingClient client = new TwilioIPMessagingClient(ACCOUNT_SID, AUTH_TOKEN);

        // Retrieve a channel
        Service service = client.getService(SERVICE_SID);
        Channel Channel = service.getChannel(CHANNEL_SID);

        // Retrieve the list of members on that channel
        MemberList list = Channel.getMembers();
        System.out.println(list);
    }
}