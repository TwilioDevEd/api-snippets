// Install the Java helper library from twilio.com/docs/java/install
import com.twilio.Twilio;
import com.twilio.rest.ipmessaging.v1.service.Channel;

public class Example {
  // Find your Account Sid and Token at twilio.com/user/account
  public static final String ACCOUNT_SID = "ACXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX";
  public static final String AUTH_TOKEN = "your_auth_token";
  public static final String SERVICE_SID = "SERVICE_SID";
  public static final String CHANNEL_SID = "CHANNEL_SID";

  public static void main(String[] args) {
    // Initialize the client
    Twilio.init(ACCOUNT_SID, AUTH_TOKEN);

    // Update the channel
    Channel channel = Channel
        .update(SERVICE_SID, CHANNEL_SID)
        .setFriendlyName("ChannelName")
        .execute();

    System.out.println(channel.getFriendlyName());
  }
}
