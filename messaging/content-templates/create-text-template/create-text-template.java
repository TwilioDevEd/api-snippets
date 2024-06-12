package Examples;

import com.twilio.rest.content.v1.Content;

import java.util.Arrays;
import java.util.Map;

public class TwilioText {
    public static String CreateTemplate() {
        var twilioText = new Content.TwilioText();
        twilioText.setBody("Hi {{1}}, thanks for contacting Owl Air Support. How can we help?");

        var types = new Content.Types();
        types.setTwilioText(twilioText);

        var createRequest = new Content.ContentCreateRequest("en", types);
        createRequest.setFriendlyName("media_template");
        createRequest.setVariables(Map.of(
        "1", "first_name"
        ));

        var content = Content.creator(createRequest).create();

        return content.getSid();
    }
}
