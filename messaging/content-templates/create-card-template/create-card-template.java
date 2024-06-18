package Examples;

import com.twilio.rest.content.v1.Content;
import java.util.Arrays;
import java.util.Map;

public class TwilioCard {
    public static String CreateTemplate() {
        var twilioText = new Content.TwilioText();
        twilioText.setBody("Hi {{1}}, thanks for contacting Owl Air Support");

        var twilioCard = new Content.TwilioCard();
        twilioCard.setTitle("Owl Air Support");

        var action1 = new Content.CardAction();
        action1.setType(Content.CardActionType.URL);
        action1.setUrl("https://www.owlair.com");
        action1.setTitle("Contact Us");

        twilioCard.setActions(Arrays.asList(action1));

        var types = new Content.Types();
        types.setTwilioCard(twilioCard);

        var createRequest = new Content.ContentCreateRequest("en", types);
        createRequest.setFriendlyName("owl_air_card");
        createRequest.setVariables(Map.of(
        "1", "John"
        ));

        var content = Content.creator(createRequest).create();

        return content.getSid();
    }
}
