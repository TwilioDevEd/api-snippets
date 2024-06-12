package Examples;

import com.twilio.rest.content.v1.Content;

import java.util.Arrays;
import java.util.Map;

public class TwilioMedia {
    public static String CreateTemplate() {
        var twilioMedia = new Content.TwilioMedia();
        twilioMedia.setBody("Thank you for your order {{1}}");
        twilioMedia.setMedia(Arrays.asList("https://twilio-cms-prod.s3.amazonaws.com/images/library-logo-resource2x.width-1000.png"));

        var types = new Content.Types();
        types.setTwilioMedia(twilioMedia);

        var createRequest = new Content.ContentCreateRequest("en", types);
        createRequest.setFriendlyName("media_template");
        createRequest.setVariables(Map.of(
        "1", "order_number"
        ));

        var content = Content.creator(createRequest).create();

        return content.getSid();
    }
}
