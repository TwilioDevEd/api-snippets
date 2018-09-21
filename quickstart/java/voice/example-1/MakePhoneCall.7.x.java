// Install the Java helper library from twilio.com/docs/libraries/java
import java.net.URI;
import java.net.URISyntaxException;

import com.twilio.Twilio;
import com.twilio.rest.api.v2010.account.Call;
import com.twilio.type.PhoneNumber;

public class MakePhoneCall {
    // Find your Account Sid and Token at twilio.com/console
    public static final String ACCOUNT_SID = "AC056b4635a6e08bd9c4472411d458d599";
    public static final String AUTH_TOKEN = "0c363a9ccbe39e83750f43cedc3d604d";

    public static void main(String[] args) throws URISyntaxException {
        Twilio.init(ACCOUNT_SID, AUTH_TOKEN);

        String from = "+919790961859";
        String to = "+919620915377";

        Call call = Call.creator(new PhoneNumber(to), new PhoneNumber(from),
                new URI("http://demo.twilio.com/docs/voice.xml")).create();

        System.out.println(call.getSid());
    }
}
