import com.twilio.http.HttpMethod;
import com.twilio.twiml.TwiMLException;
import com.twilio.twiml.voice.Dial;
import com.twilio.twiml.voice.Number;
import com.twilio.twiml.voice.Number.Event;
import com.twilio.twiml.VoiceResponse;
import java.util.Arrays;
import java.util.List;

public class Example {
    public static void main(String[] args) {
        List<Event> events = Arrays.asList(
            Event.INITIATED,
            Event.RINGING,
            Event.ANSWERED,
            Event.COMPLETED
        );

        Number number = new Number.Builder("+14158675310")
            .statusCallback("https://myapp.com/calls/events")
            .statusCallbackMethod(HttpMethod.POST)
            .statusCallbackEvents(events)
            .build();

        Dial dial = new Dial.Builder().number(number).build();
        VoiceResponse response = new VoiceResponse.Builder().dial(dial).build();

        try {
            System.out.println(response.toXml());
        } catch (TwiMLException e) {
            e.printStackTrace();
        }
    }
}
