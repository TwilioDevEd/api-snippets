// Install the Java helper library from twilio.com/docs/java/install
import java.util.Arrays;
import java.util.List;

import com.twilio.Twilio;
import com.twilio.rest.notify.v1.service.Binding;

public class Example {
    // Get your Account SID and Auth Token from https://twilio.com/console
    // To set up environment variables, see http://twil.io/secure
    public static final String ACCOUNT_SID = System.getenv("TWILIO_ACCOUNT_SID");
    public static final String AUTH_TOKEN = System.getenv("TWILIO_AUTH_TOKEN");

    public static final String SERVICE_SID = System.getenv("TWILIO_SERVICE_SID");

    public static void main(String[] args) {
        // Initialize the client
        Twilio.init(ACCOUNT_SID, AUTH_TOKEN);

        List<String> tags = Arrays.asList("premium", "new user");

        String endpoint = "XXXXXXXXXXXXXXX";
        String identity = "00000001";
        String address = "fcm_device_token";

        Binding binding = Binding
                .creator(SERVICE_SID, identity, Binding.BindingType.FACEBOOK_MESSENGER, address)
                .setEndpoint(endpoint)
                .setTag(tags)
                .create();

        System.out.println(binding.getSid());
    }
}
