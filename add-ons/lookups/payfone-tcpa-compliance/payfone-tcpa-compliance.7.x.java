// Download the Java helper library from twilio.com/docs/libraries/java
import com.twilio.Twilio;
import com.twilio.rest.lookups.v1.PhoneNumber;

import java.util.Arrays;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

public class Example {

    // Get your Account SID and Auth Token from twilio.com/console
    public static final String ACCOUNT_SID = "ACXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX";
    public static final String AUTH_TOKEN = "your_auth_token";

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
