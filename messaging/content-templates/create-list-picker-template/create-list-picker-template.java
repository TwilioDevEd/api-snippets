package Examples;

import com.twilio.rest.content.v1.Content;

import java.util.Arrays;
import java.util.Map;

public class TwilioListPicker {
    public static String CreateTemplate() {
        var twilioListPicker = new Content.TwilioListPicker();
        twilioListPicker.setBody("Owl Air Flash Sale! Hurry! Sale ends on {{1}}!");

        var item1 = new Content.ListItem();
        item1.setItem("SFO to NYC for $299");
        item1.setDescription("Owl Air Flight 1337 to LGA");
        item1.setId("SFO1337");

        var item2 = new Content.ListItem();
        item1.setItem("OAK to Denver for $149");
        item1.setDescription("Owl Air Flight 5280 to DEN");
        item1.setId("OAK5280");

        var item3 = new Content.ListItem();
        item1.setItem("LAX to Chicago for $199");
        item1.setDescription("Owl Air Flight 96 to ORD");
        item1.setId("LAX96");

        twilioListPicker.setItems(Arrays.asList(item1));
        twilioListPicker.setButton("Select Flight");

        var types = new Content.Types();
        types.setTwilioListPicker(twilioListPicker);

        var createRequest = new Content.ContentCreateRequest("en", types);
        createRequest.setFriendlyName("owl_air_list");
        createRequest.setVariables(Map.of(
        "1", "end_date"
        ));

        var content = Content.creator(createRequest).create();

        return content.getSid();
    }
}
