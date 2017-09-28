package com.twilio;

// Install the Java helper library from twilio.com/docs/java/install
import com.twilio.Twilio;
import com.twilio.rest.chat.v2.Service;

public class Example {
    // Find your Account Sid at https://www.twilio.com/console/account/settings
    public static final String ACCOUNT_SID = "ACXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX";
    // Create an API Key and Secret at https://www.twilio.com/console/chat/dev-tools/api-keys
    public static final String API_KEY = "SKXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX";
    public static final String API_SECRET = "your_api_secret";

    // Your Chat Service SID from https://www.twilio.com/console/chat/services
    public static final String SERVICE_SID = "ISXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX";

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
