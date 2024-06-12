package Examples;

import com.twilio.rest.content.v1.Content;

import java.util.Arrays;
import java.util.Map;

public class TwilioQuickReply {
    public static String CreateTemplate() {
        var twilioText = new Content.TwilioText();
        twilioText.setBody("Hi {{1}}.  Thanks for contacting Owl Air Support. How can we help?");

        var twilioQuickReply = new Content.TwilioQuickReply();
        twilioQuickReply.setBody("Owl Air Support");

        var action1 = new Content.QuickReplyAction();
        action1.setType(Content.QuickReplyActionType.QUICK_REPLY);
        action1.setTitle("Contact Us");
        action1.setId("contact_us");

        var action2 = new Content.QuickReplyAction();
        action1.setType(Content.QuickReplyActionType.QUICK_REPLY);
        action1.setTitle("Check gate number");
        action1.setId("gate_id_1");

        var action3 = new Content.QuickReplyAction();
        action1.setType(Content.QuickReplyActionType.QUICK_REPLY);
        action1.setTitle("Speak with an agent");
        action1.setId("agent_id_1");

        twilioQuickReply.setActions(Arrays.asList(action1, action2, action3));

        var types = new Content.Types();
        types.setTwilioText(twilioText);
        types.setTwilioQuickReply(twilioQuickReply);

        var createRequest = new Content.ContentCreateRequest("en", types);
        createRequest.setFriendlyName("owl_air_qr");
        createRequest.setVariables(Map.of(
        "1", "first_name"
        ));

        var content = Content.creator(createRequest).create();

        return content.getSid();
    }
}
