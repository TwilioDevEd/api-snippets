// NOTE: This example uses the next generation Twilio helper library - for more
// information on how to download and install this version, visit
// https://www.twilio.com/docs/libraries/java
import com.twilio.Twilio;
import com.twilio.rest.notify.v1.service.Notification;

public class Example {
    // Find your Account Sid and Token at twilio.com/user/account
    public static final String ACCOUNT_SID = "ACXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX";
    public static final String AUTH_TOKEN = "your_auth_token";

    public static final String SERVICE_SID = "ISXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX";

    public static void main(String[] args) {
        // Initialize the client
        Twilio.init(ACCOUNT_SID, AUTH_TOKEN);

        Notification notification = Notification
                .creator(SERVICE_SID)
                .setTitle("Generic loooooooong title for all Bindings")
                .setBody("This is the body for all Bindings")
                .setIdentity("00000001")
                .setData("{\"custom_key1\":\"custom value 1\"," +
                         "\"custom_key2\":\"custom value 2\"}")
                .setFcm("{\"notification\":{\"title\":\"New alert\"," +
                        "\"body\" : \"Hello Bob!\"}}")
                .setApn("{\"aps\" : " +
                        "{ \"alert\": " +
                        "{\"title\":\"New alert\"," +
                        "\"body\" : \"Hello Bob!\"}}}")
                .create();

        System.out.println(notification.getSid());
    }
}
