// NOTE: This example uses the next generation Twilio helper library - for more
// information on how to download and install this version, visit
// https://www.twilio.com/docs/libraries/java
import com.twilio.Twilio;
import com.twilio.base.ResourceSet;
import com.twilio.rest.notify.v1.service.Binding;

import java.time.LocalDate;

public class Example {
    // Find your Account Sid and Token at twilio.com/user/account
    // To set up environment variables, see http://twil.io/secure
    public static final String ACCOUNT_SID = System.getenv("TWILIO_ACCOUNT_SID");
    public static final String AUTH_TOKEN = System.getenv("TWILIO_AUTH_TOKEN");

    public static final String SERVICE_SID = System.getenv("TWILIO_SERVICE_SID");

    public static void main(String args[]) {
        // Initialize the client
        Twilio.init(ACCOUNT_SID, AUTH_TOKEN);

        // List the bindings
        ResourceSet<Binding> bindings = Binding.reader(SERVICE_SID)
                .setStartDate(LocalDate.of(2005, 8, 18))
                .setTag("new user")
                .read();

        for (Binding binding : bindings) {
            System.out.println(binding.getEndpoint());
        }
    }
}
