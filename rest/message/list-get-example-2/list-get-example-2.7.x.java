// Install the Java helper library from twilio.com/docs/java/install
import com.twilio.Twilio;
import com.twilio.base.ResourceSet;
import com.twilio.rest.api.v2010.account.Message;
import com.twilio.type.PhoneNumber;
import org.joda.time.DateTime;

public class Example {

    // Find your Account Sid and Token at twilio.com/user/account
    public static final String ACCOUNT_SID = "ACXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX";
    public static final String AUTH_TOKEN = "your_auth_token";

    public static void main(String[] args) {
        Twilio.init(ACCOUNT_SID, AUTH_TOKEN);

        ResourceSet<Message> messages = Message
                .read()
                .byTo(new PhoneNumber("to_number"))
                .byFrom(new PhoneNumber("from_number"))
                .byDateSent(DateTime.parse("2016-01-01'T'09:28:00Z")).execute();

        // Loop over messages and print out a property for each one.
        for (Message message : messages) {
            System.out.println(message.getBody());
        }
    }
}

