// Install the Java helper library from twilio.com/docs/java/install
import com.twilio.Twilio;
import com.twilio.exception.ApiException;
import com.twilio.rest.content.v1.Content;

import java.util.Map;

public class Example {
    // Find your Account SID and Auth Token at twilio.com/console
    // and set the environment variables. See http://twil.io/secure
    public static final String ACCOUNT_SID = System.getenv("TWILIO_ACCOUNT_SID");
    public static final String AUTH_TOKEN = System.getenv("TWILIO_AUTH_TOKEN");

    public static void main(String[] args) {
        // Initialize the SDK
        Twilio.init(ACCOUNT_SID, AUTH_TOKEN);

        // Setup Content
        Content.TwilioText type = new Content.TwilioText();
        type.setBody("Hi, {{1}}. \n Thanks for contacting Owl Air Support. How can I help?.");

        Content.Types types = new Content.Types();
        types.setTwilioText(type);

        // Create Content
        Content.ContentCreateRequest createRequest = new Content.ContentCreateRequest("en", types);
        createRequest.setVariables(Map.of("1", "name"));
        createRequest.setFriendlyName("Owl Air Support text template");
        try {
            Content content = Content.creator(createRequest).create();
            System.out.println(content.getSid());
        } catch (ApiException e) {
            e.printStackTrace();
        }
    }
}
