import com.twilio.Twilio;
import com.twilio.base.ResourceSet;
import com.twilio.rest.messaging.v1.service.PhoneNumber;

import java.util.Arrays;
import java.util.List;

public class Example {
    // Find your Account Sid and Token at twilio.com/console
    public static final String ACCOUNT_SID = "ACXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX";
    public static final String AUTH_TOKEN = "your_auth_token";

    public static void main(String[] args) {
        // Initialize the client
        Twilio.init(ACCOUNT_SID, AUTH_TOKEN);

        String pathServiceSid = "MG2172dd2db502e20dd981ef0d67850e1a";
        List<String> phoneNumberSids = Arrays
                .asList("PN2a0747eba6abf96b7e3c3ff0b4530f6e",
                        "PN557ce644e5ab84fa21cc21112e22c485",
                        "PN2a0747eba6abf96b7e3c3ff0b4530f6e");

        for (String phoneNumberSid : phoneNumberSids) {
            PhoneNumber phoneNumber = PhoneNumber
                    .creator(pathServiceSid, phoneNumberSid)
                    .create();

            System.out.println(phoneNumber);
        }
    }
}
