// Get the Java helper library from https://twilio.com/docs/libraries/java
import com.twilio.Twilio;
import com.twilio.base.ResourceSet;
import com.twilio.rest.preview.deployedDevices.fleet;
import java.io.IOException;
import java.nio.file.Files;
import java.nio.file.Paths;

public class Example {
    // Get your Account SID and Auth Token from https://twilio.com/console
    // To set up environment variables, see http://twil.io/secure
    public static final String ACCOUNT_SID = System.getenv("TWILIO_ACCOUNT_SID");
    public static final String AUTH_TOKEN = System.getenv("TWILIO_AUTH_TOKEN");

    public static void main(String[] args) {
        Twilio.init(ACCOUNT_SID, AUTH_TOKEN);

        String fleetSid = "FLXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX";
        String deviceSid = "THXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX";
        DeviceDeleter deviceDeleter = DeviceDeleter(fleetSid, deviceSid);

        boolean wasDeleted = deviceDeleter.Delete();

        System.out.println(wasDeleted);
    }
}
