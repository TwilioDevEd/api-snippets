// NOTE: This example uses the next generation Twilio helper library - for more
// information on how to download and install this version, visit
// https://www.twilio.com/docs/libraries/java
import java.util.HashMap;
import java.util.Map;

import com.twilio.Twilio;
import com.twilio.rest.notify.v1.service.Notification;

public class Example {
    // Get your Account SID and Auth Token from https://twilio.com/console
    // To set up environment variables, see http://twil.io/secure
    public static final String ACCOUNT_SID = System.getenv("TWILIO_ACCOUNT_SID");
    public static final String AUTH_TOKEN = System.getenv("TWILIO_AUTH_TOKEN");

    public static final String SERVICE_SID = System.getenv("TWILIO_SERVICE_SID");

    public static void main(String[] args) {
        // Initialize the client
        Twilio.init(ACCOUNT_SID, AUTH_TOKEN);

        Map<String, Object> data = new HashMap<>();
        data.put("custom_key1", "custom value 1");
        data.put("custom_key2", "custom value 2");

        Map<String, Object> fcmParams = new HashMap<>();
        fcmParams.put("notification", "{\"title\":\"New alert\", \"body\" : \"Hello Bob!\"}}");

        Map<String, Object> apnParams = new HashMap<>();
        apnParams.put("aps","{ \"alert\": {\"title\":\"New alert\", \"body\" : \"Hello Bob!\"}}");

        Notification notification = Notification
                .creator(SERVICE_SID)
                .setTitle("Generic loooooooong title for all Bindings")
                .setBody("This is the body for all Bindings")
                .setIdentity("00000001")
                .setData(data)
                .setFcm(fcmParams)
                .setApn(apnParams)
                .create();

        System.out.println(notification.getSid());
    }
}
