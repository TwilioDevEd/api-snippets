// Install the Java helper library from twilio.com/docs/java/install
import com.twilio.sdk.TwilioRestClient;
import com.twilio.sdk.TwilioRestException;
import com.twilio.sdk.resource.instance.Message;
import com.twilio.sdk.resource.list.MessageList;

import java.util.HashMap;
import java.util.Map;

public class Example {

    // Find your Account Sid and Token at twilio.com/user/account
    public static final String ACCOUNT_SID = "ACXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX";
    public static final String AUTH_TOKEN = "your_auth_token";

    public static void main(String[] args) throws TwilioRestException {
        TwilioRestClient client = new TwilioRestClient(ACCOUNT_SID, AUTH_TOKEN);

        Map<String, String> filters = new HashMap<>();
        filters.put("From", "");
        filters.put("To", "");
        filters.put("DateSent>", "2015-01-01");
        MessageList messages = client.getAccount().getMessages(filters);

        // Loop over messages and print out a property for each one.
        for (Message message : messages) {
            System.out.println(message.getBody());
        }
    }
}

