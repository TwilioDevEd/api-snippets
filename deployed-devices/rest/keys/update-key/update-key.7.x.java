// Get the Node helper library from https://twilio.com/docs/libraries/java

import com.twilio.Twilio;
import com.twilio.rest.preview.deployedDevices.fleet.Key;
import com.twilio.rest.preview.deployedDevices.fleet.KeyUpdater;

public class Example {
    // Get your Account SID and Auth Token from https://twilio.com/console
    public static final String ACCOUNT_SID = "ACXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX";
    public static final String AUTH_TOKEN = "your_auth_token";

    public static void main(String[] args) {
        Twilio.init(ACCOUNT_SID, AUTH_TOKEN);

        String fleetSid = "FLXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX";
        String keySid = "KYXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX";

        Key key = new KeyUpdater(fleetSid, keySid)
                .setDeviceSid("THXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX")
                .setFriendlyName("My New Device Key")
                .update();

        System.out.println(key.getDeviceSid());
    }
}
