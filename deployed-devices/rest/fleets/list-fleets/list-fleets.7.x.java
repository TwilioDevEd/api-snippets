// Get the Node helper library from https://twilio.com/docs/libraries/java
import com.twilio.Twilio;
import com.twilio.base.ResourceSet;
import com.twilio.rest.preview.deployedDevices.Fleet;
import com.twilio.rest.preview.deployedDevices.FleetReader;

public class Example {
    // Get your Account SID and Auth Token from https://twilio.com/console
    public static final String ACCOUNT_SID = "ACXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX";
    public static final String AUTH_TOKEN = "your_auth_token";

    public static void main(String[] args) {
        Twilio.init(ACCOUNT_SID, AUTH_TOKEN);

        String fleetSid = "FLXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX";
        String deviceSid = "THXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX";

        ResourceSet<Fleet> fleets = new FleetReader().read();

        for(Fleet fleet: fleets) {
            System.out.println(fleet.getSid());
        }
    }
}
