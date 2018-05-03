import com.twilio.twiml.TwiMLException;
import com.twilio.twiml.voice.Conference;
import com.twilio.twiml.voice.Dial;
import com.twilio.twiml.VoiceResponse;
import java.util.Arrays;
import static com.twilio.twiml.voice.Conference.Event;

public class Example {
    public static void main(String[] args) {
        Conference conference = new Conference.Builder("EventedConf")
            .statusCallback("https://myapp.com/events")
            .statusCallbackEvents(Arrays.asList(Event.START,
            Event.END, Event.JOIN, Event.LEAVE,
            Event.MUTE, Event.HOLD)).build();
        Dial dial = new Dial.Builder().conference(conference).build();
        VoiceResponse response = new VoiceResponse.Builder().dial(dial).build();

        try {
            System.out.println(response.toXml());
        } catch (TwiMLException e) {
            e.printStackTrace();
        }
    }
}
