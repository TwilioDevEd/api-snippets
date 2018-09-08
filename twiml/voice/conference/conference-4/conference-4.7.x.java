import com.twilio.twiml.TwiMLException;
import com.twilio.twiml.voice.Conference;
import com.twilio.twiml.voice.Dial;
import com.twilio.twiml.VoiceResponse;
import java.util.Arrays;
import java.util.List;

import static com.twilio.twiml.voice.Conference.Event;

public class Example {
    public static void main(String[] args) {
        List<Event> events = Arrays.asList(
            Event.START,
            Event.END,
            Event.JOIN,
            Event.LEAVE,
            Event.MUTE,
            Event.HOLD
        );

        Conference conference = new Conference.Builder("EventedConf")
            .statusCallback("https://myapp.com/events")
            .statusCallbackEvents(events)
            .build();

        Dial dial = new Dial.Builder().conference(conference).build();
        VoiceResponse response = new VoiceResponse.Builder().dial(dial).build();

        try {
            System.out.println(response.toXml());
        } catch (TwiMLException e) {
            e.printStackTrace();
        }
    }
}
