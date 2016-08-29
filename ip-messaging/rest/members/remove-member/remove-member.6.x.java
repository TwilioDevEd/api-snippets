import com.twilio.sdk.TwilioIPMessagingClient;
import com.twilio.sdk.resource.instance.ipmessaging.Service;
import com.twilio.sdk.resource.instance.ipmessaging.Channel;
import com.twilio.sdk.resource.list.ipmessaging.MemberList;
import com.twilio.sdk.resource.instance.ipmessaging.Member;

public class TwilioTest {
    // Find your Account Sid and Token at twilio.com/user/account
    public static final String ACCOUNT_SID = "ACCOUNT_SID";
    public static final String AUTH_TOKEN = "AUTH_TOKEN";

    public static final String SERVICE_SID = "SERVICE_SID";
    public static final String CHANNEL_SID = "CHANNEL_SID";
    public static final String MEMBER_SID = "MEMBER_SID";

    public static void main(String args[]) throws TwilioRestException {
        // Initialize the client
        TwilioIPMessagingClient client = new TwilioIPMessagingClient(ACCOUNT_SID, AUTH_TOKEN);

        // Delete a a member from the channel
        Service service = client.getService(SERVICE_SID);
        Channel channel = service.getChannel(CHANNEL_SID);
        channel.getMember(MEMBER_SID).delete();
    }
}