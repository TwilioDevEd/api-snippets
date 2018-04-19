// Install the Java helper library from twilio.com/docs/java/install
import com.twilio.Twilio;
import com.twilio.base.ResourceSet;
import com.twilio.rest.api.v2010.account.Recording;

public class Example {
    /// Find your Account Sid and Token at twilio.com/user/account
    public static final String ACCOUNT_SID = "ACXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX";
    public static final String AUTH_TOKEN = "your_auth_token";
    public static final String RECORDING_ID = "RE557ce644e5ab84fa21cc21112e22c485";

    public static void main(String[] args) {
        Twilio.init(ACCOUNT_SID, AUTH_TOKEN);

        Recording recording = Recording.fetcher(ACCOUNT_SID, RECORDING_ID).fetch();
    }
}
