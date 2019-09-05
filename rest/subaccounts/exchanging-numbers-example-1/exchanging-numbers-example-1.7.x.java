// Install the Java helper library from twilio.com/docs/java/install

import com.twilio.Twilio;
import com.twilio.rest.api.v2010.account.IncomingPhoneNumber;

public class Example {
    // Find your Account Sid and Token at twilio.com/console
    // DANGER! This is insecure. See http://twil.io/secure
    public static final String ACCOUNT_SID = "AC00000000000000000000000000000001";
    public static final String AUTH_TOKEN = "your_auth_token";

    public static void main(String[] args) {
        Twilio.init(ACCOUNT_SID, AUTH_TOKEN);
        IncomingPhoneNumber incomingPhoneNumber = IncomingPhoneNumber.updater(
                "PNXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX")
            .setAccountSid("AC00000000000000000000000000000002")
            .update();

        System.out.println(incomingPhoneNumber.getFriendlyName());
    }
}
