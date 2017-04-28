// Install the Java helper library from twilio.com/docs/java/install
import com.twilio.Twilio;
import com.twilio.rest.chat.v2.service.channel.Member;

public class Example {
  // Find your Account Sid and Token at twilio.com/user/account
  public static final String ACCOUNT_SID = "ACXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX";
  public static final String AUTH_TOKEN = "your_auth_token";

  public static final String SERVICE_SID = "ISXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX";
  public static final String CHANNEL_SID = "CHXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX";
  public static final String MEMBER_SID = "MBXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX";

  public static void main(String[] args) {
    // Initialize the client
    Twilio.init(ACCOUNT_SID, AUTH_TOKEN);

    // Delete a a member from the channel
    boolean deleted = Member.deleter(SERVICE_SID, CHANNEL_SID, MEMBER_SID).delete();

    System.out.println(deleted);
  }
}
