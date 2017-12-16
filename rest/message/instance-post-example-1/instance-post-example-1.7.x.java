// Install the Java helper library from twilio.com/docs/java/install
import com.twilio.Twilio;
import com.twilio.rest.api.v2010.account.Message;

public class Example {

    // Find your Account Sid and Token at twilio.com/user/account
    public static final String ACCOUNT_SID = "ACXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX";
    public static final String AUTH_TOKEN = "your_auth_token";

    public static void main(String[] args) {
        Twilio.init(ACCOUNT_SID, AUTH_TOKEN);

        // Get an object from its sid. If you do not have a sid,
        // check out the list resource examples on this page
        String messageSid = "MM5ef8732a3c49700934481addd5ce1659";
        String body = "";
        Message message = Message.updater(messageSid, body).update();

        System.out.println(message.getBody()); // will be empty string
    }
}
