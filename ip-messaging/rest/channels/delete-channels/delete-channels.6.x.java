import com.twilio.sdk.resource.instance.ipmessaging.Channel;
import com.twilio.sdk.resource.list.ipmessaging.ChannelList;
import com.twilio.sdk.TwilioIPMessagingClient;
import com.twilio.sdk.resource.instance.ipmessaging.Service;
import com.twilio.sdk.TwilioRestException;

public class TwilioTest {
  // Find your Account Sid and Token at twilio.com/user/account
  public static final String ACCOUNT_SID = "ACXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX";
  public static final String AUTH_TOKEN = "your_auth_token";
  public static final String SERVICE_SID = "ISXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX";

  public static void main(String args[]) throws TwilioRestException {
    // Initialize the client
    TwilioIPMessagingClient client = new TwilioIPMessagingClient(ACCOUNT_SID, AUTH_TOKEN);
    Service service = client.getService(SERVICE_SID);

    // Get the channel
    Channel channel = service.getChannel("CHXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX");

    // Delete the channel
    boolean didDelete = channel.delete();
    System.out.println(didDelete);
  }
}
