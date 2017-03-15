import com.twilio.Twilio;
import com.twilio.base.ResourceSet;
import com.twilio.rest.messaging.v1.service.PhoneNumber;

public class Example {
    // Find your Account Sid and Token at twilio.com/console
    public static final String ACCOUNT_SID = "ACXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX";
    public static final String AUTH_TOKEN = "your_auth_token";

    public static void main(String[] args) {
        // Initialize the client
        Twilio.init(ACCOUNT_SID, AUTH_TOKEN);

        String pathServiceSid = "MG2172dd2db502e20dd981ef0d67850e1a";
        ResourceSet<PhoneNumber> phoneNumbers = PhoneNumber.reader(pathServiceSid)
                                                           .read();

        for (PhoneNumber phoneNumber : phoneNumbers) {
            System.out.println(phoneNumber);
        }
    }
}
