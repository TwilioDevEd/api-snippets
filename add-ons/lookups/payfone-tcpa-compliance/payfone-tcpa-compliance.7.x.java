// Download the Java helper library from twilio.com/docs/libraries/java
import com.twilio.Twilio;
import com.twilio.rest.lookups.v1.PhoneNumber;

import java.util.Arrays;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

public class Example {

    // Get your Account SID and Auth Token from twilio.com/console
    // To set up environment variables, see http://twil.io/secure
    public static final String ACCOUNT_SID = System.getenv("TWILIO_ACCOUNT_SID");
    public static final String AUTH_TOKEN = System.getenv("TWILIO_AUTH_TOKEN");

    public static void main(String[] args) {
        Twilio.init(ACCOUNT_SID, AUTH_TOKEN);

        List<String> addOns = Arrays.asList("payfone_tcpa_compliance");
        Map<String, Object> addOnsData = new HashMap<String, Object>() {{
            put("payfone_tcpa_compliance.RightPartyContactedDate", "20160101");
        }};

        PhoneNumber number = PhoneNumber
                .fetcher(new com.twilio.type.PhoneNumber("+15108675310"))
                .setAddOns(addOns)
                .setAddOnsData(addOnsData)
                .fetch();

        System.out.println(number.getAddOns());
    }
}
