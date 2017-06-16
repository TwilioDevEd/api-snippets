// NOTE: This example uses the next generation Twilio helper library - for more
// information on how to download and install this version, visit
// https://www.twilio.com/docs/libraries/java
import com.twilio.Twilio;
import com.twilio.base.ResourceSet;
import com.twilio.rest.notify.v1.service.Binding;
import org.joda.time.LocalDate;

public class Example {
    // Find your Account Sid and Token at twilio.com/user/account
    public static final String ACCOUNT_SID = "ACXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX";
    public static final String AUTH_TOKEN = "your_auth_token";

    public static final String SERVICE_SID = "ISXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX";

    public static void main(String args[]) {
        // Initialize the client
        Twilio.init(ACCOUNT_SID, AUTH_TOKEN);

        // List the bindings
        ResourceSet<Binding> bindings = Binding.reader(SERVICE_SID)
                .setStartDate(LocalDate.parse("2005-8-18"))
                .setTag("new user")
                .read();

        for (Binding binding : bindings) {
            System.out.println(binding.getEndpoint());
        }
    }
}
