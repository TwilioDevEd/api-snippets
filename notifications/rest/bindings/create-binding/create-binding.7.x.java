// NOTE: This example uses the next generation Twilio helper library - for more
// information on how to download and install this version, visit
// https://www.twilio.com/docs/libraries/java
import java.util.Arrays;
import java.util.List;

import com.twilio.Twilio;
import com.twilio.rest.notify.v1.service.Binding;

public class Example {
    // Find your Account Sid and Token at twilio.com/user/account
    public static final String ACCOUNT_SID = "ACCOUNT_SID";
    public static final String AUTH_TOKEN = "AUTH_TOKEN";

    public static final String SERVICE_SID = "ISXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX";

    public static void main(String[] args) {
        // Initialize the client
        Twilio.init(ACCOUNT_SID, AUTH_TOKEN);

        List<String> tags = Arrays.asList("premium", "new user");

        Binding binding = Binding
                .creator(SERVICE_SID,
                        "00000001",
                        Binding.BindingType.APN,
                        "device_token")
                .setEndpoint("endpoint_id")
                .setTag(tags)
                .create();

        System.out.println(binding.getSid());
    }
}
