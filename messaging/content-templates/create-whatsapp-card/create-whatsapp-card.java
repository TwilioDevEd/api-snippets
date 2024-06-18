package Examples;

import com.twilio.rest.content.v1.Content;

import java.util.Arrays;
import java.util.Map;

public class WhatsAppCard {
    public static String CreateTemplate() {
        var waCard = new Content.WhatsappCard();
        waCard.setBody("Congratulations, you have reached Elite status! Add code {{1}} for 10% off.");
        waCard.setHeaderText("This is a {{1}} card");
        waCard.setFooter("To unsubscribe, reply Stop");

        var action1 = new Content.CardAction();
        action1.setType(Content.CardActionType.URL);
        action1.setUrl("https://www.twilio.com");
        action1.setTitle("Order Online");

        var action2 = new Content.CardAction();
        action1.setType(Content.CardActionType.PHONE_NUMBER);
        action1.setPhone("+15551234567");
        action1.setTitle("Call Us");

        waCard.setActions(Arrays.asList(action1));

        var types = new Content.Types();
        types.setWhatsappCard(waCard);

        var createRequest = new Content.ContentCreateRequest("en", types);
        createRequest.setFriendlyName("owl_coupon_code");
        createRequest.setVariables(Map.of(
        "1", "coupon_code"
        ));

        var content = Content.creator(createRequest).create();

        return content.getSid();
    }
}
