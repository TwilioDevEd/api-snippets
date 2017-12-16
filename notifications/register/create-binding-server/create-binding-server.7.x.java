// Install the Java helper library from twilio.com/docs/java/install
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

        String endpoint = "xxx";
        String identity = "00000001";
        String address = "xxx";
        Binding binding = Binding
                .creator(SERVICE_SID, identity, Binding.BindingType.GCM, address)
                .setEndpoint(endpoint)
                .setTag(tags)
                .create();

        System.out.println(binding.getSid());
    }
}
