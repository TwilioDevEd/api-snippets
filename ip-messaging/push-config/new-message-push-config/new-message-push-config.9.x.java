package com.twilio;

// Install the Java helper library from twilio.com/docs/java/install
import com.twilio.Twilio;
import com.twilio.rest.chat.v2.Service;

public class Example {
    // Get your Account SID from https://twilio.com/console
    // To set up environment variables, see http://twil.io/secure
    public static final String ACCOUNT_SID = System.getenv("TWILIO_ACCOUNT_SID");
    // Create an API Key and Secret at https://www.twilio.com/console/chat/dev-tools/api-keys
    public static final String API_KEY = System.getenv("TWILIO_API_KEY");
    public static final String API_SECRET = System.getenv("TWILIO_API_SECRET");

    // Your Chat Service SID from https://www.twilio.com/console/chat/services
    public static final String SERVICE_SID = System.getenv("TWILIO_SERVICE_SID");

    public static void main(String[] args) {
        // Authenticate with Twilio
        Twilio.init(API_KEY, API_SECRET, ACCOUNT_SID);

        // Update the service webhooks
        String newMessageTemplate = "A New message in ${CHANNEL} from ${USER}: " +
                "${MESSAGE}";
        Service service = Service.updater(SERVICE_SID)
                .setNotificationsNewMessageEnabled(true)
                .setNotificationsNewMessageTemplate(newMessageTemplate)
                .setNotificationsNewMessageSound("default")
                .update();


        System.out.println(service.getSid());
    }
}
