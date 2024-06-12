package Examples;

import com.twilio.rest.content.v1.Content;
import java.util.Arrays;
import java.util.Map;

public class TwilioCallToAction {
    public static String CreateTemplate() {
        var twilioCallToAction = new Content.TwilioCallToAction();
        twilioCallToAction.setBody("Owl Air: We will see you soon! Flight {{1}} to {{2}} departs at {{3}} from Gate {{4}}.");

        var action1 = new Content.CallToActionAction();
        action1.setType(Content.CallToActionActionType.URL);
        action1.setUrl("https://owlair.com/{{5}}");
        action1.setTitle("Check Flight Status");

        var action2 = new Content.CallToActionAction();
        action2.setType(Content.CallToActionActionType.PHONE_NUMBER);
        action2.setPhone("+18005551234");
        action2.setTitle("Call Support");

        twilioCallToAction.setActions(Arrays.asList(action1, action2));

        var types = new Content.Types();
        types.setTwilioCallToAction(twilioCallToAction);

        var createRequest = new Content.ContentCreateRequest("en", types);
        createRequest.setFriendlyName("owl_air_cta");
        createRequest.setVariables(Map.of(
        "1", "flight_number",
        "2", "arrival_city",
        "3", "departure_time",
        "4", "gate_number",
        "5", "url_suffix"
        ));

        var content = Content.creator(createRequest).create();

        return content.getSid();
    }
}
