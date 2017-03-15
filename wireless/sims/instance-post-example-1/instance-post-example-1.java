// Install the Java preview helper library from:
// https://www.twilio.com/docs/libraries/java#accessing-preview-twilio-features

import com.twilio.Twilio;
import com.twilio.rest.preview.wireless.*;

public class Example {

    // Find your Account Sid and Token at twilio.com/user/account
    public static final String ACCOUNT_SID = "AC8caa2afb9d5279926619c458dc7099a8";
    public static final String AUTH_TOKEN = "your_auth_token";

    public static void main(String[] args) {
        Twilio.init(ACCOUNT_SID, AUTH_TOKEN);
        Sim updatedSim = Sim.updater("DEd3f4ec6c85ded1a5f64f10afc067895c")
                .setStatus("active").update();
        System.out.println("Status: " + updatedSim.getStatus());
    }

}