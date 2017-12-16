import com.twilio.twiml.Conference;
import com.twilio.twiml.Dial;
import com.twilio.twiml.VoiceResponse;
import com.twilio.twiml.TwiMLException;
import java.util.Arrays;
import static com.twilio.twiml.Conference.ConferenceEvent;

public class Example {
    public static void main(String[] args) {
        Conference conference = new Conference.Builder("EventedConf")
            .statusCallback("https://myapp.com/events")
            .statusCallbackEvents(Arrays.asList(ConferenceEvent.START,
            ConferenceEvent.END, ConferenceEvent.JOIN, ConferenceEvent.LEAVE,
            ConferenceEvent.MUTE, ConferenceEvent.HOLD)).build();
        Dial dial = new Dial.Builder().conference(conference).build();
        VoiceResponse response = new VoiceResponse.Builder().dial(dial).build();

        try {
            System.out.println(response.toXml());
        } catch (TwiMLException e) {
            e.printStackTrace();
        }
    }
}
