// Install the Java preview helper library from:
// https://www.twilio.com/docs/libraries/java#accessing-preview-twilio-features

import com.twilio.Twilio;
import com.twilio.rest.preview.wireless.*;

public class Example {

        // Find your Account Sid and Token at twilio.com/user/account
        public static final String ACCOUNT_SID = "ACXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX";
        public static final String AUTH_TOKEN = "your_auth_token";

        public static void main(String[] args) {
            Twilio.init(ACCOUNT_SID, AUTH_TOKEN);
            Sim sim = Sim.fetcher("AliceSmithSmartMeter").fetch();
            System.out.println(sim.getStatus());
        }

}