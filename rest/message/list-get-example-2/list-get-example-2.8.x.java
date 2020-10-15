// Install the Java helper library from twilio.com/docs/java/install
import com.twilio.Twilio;
import com.twilio.base.ResourceSet;
import com.twilio.rest.api.v2010.account.Message;
import com.twilio.type.PhoneNumber;

import java.time.ZonedDateTime;

public class Example {

    // Find your Account Sid and Token at twilio.com/user/account
    public static final String ACCOUNT_SID = "ACXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX";
    public static final String AUTH_TOKEN = "your_auth_token";

    public static void main(String[] args) {
        Twilio.init(ACCOUNT_SID, AUTH_TOKEN);

        ZonedDateTime dateTime = ZonedDateTime.of(2016, 1, 1, 9, 28, 0, 0, ZoneId.of("UTC"));

        ResourceSet<Message> messages = Message
                .reader()
                .setTo(new PhoneNumber("to_number"))
                .setFrom(new PhoneNumber("from_number"))
                .setDateSent(dateTime).read();

        // Loop over messages and print out a property for each one.
        for (Message message : messages) {
            System.out.println(message.getBody());
        }
    }
}

