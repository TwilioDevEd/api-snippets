package Examples;

import com.twilio.rest.content.v1.Content;
import java.math.BigDecimal;
import java.util.Arrays;
import java.util.Map;

public class TwilioLocation {
    public static String CreateTemplate() {
        var twilioText = new Content.TwilioText();
        twilioText.setBody("Owl Air: Time to board, SFO is located at San Francisco International Airport, P.O. Box 8097, San Francisco, CA 94128");

        var twilioLocation = new Content.TwilioLocation();
        twilioLocation.setLabel("Time to Board @ SFO");
        twilioLocation.setLatitude(new BigDecimal(37.62159755922449));
        twilioLocation.setLongitude(new BigDecimal(-122.37888566473057));

        var types = new Content.Types();
        types.setTwilioText(twilioText);
        types.setTwilioLocation(twilioLocation);

        var createRequest = new Content.ContentCreateRequest("en", types);
        createRequest.setFriendlyName("owl_air_location");
        createRequest.setVariables(Map.of(
        "1", "John"
        ));

        var content = Content.creator(createRequest).create();

        return content.getSid();
    }
}
