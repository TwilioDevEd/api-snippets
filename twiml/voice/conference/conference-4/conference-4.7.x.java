import com.twilio.twiml.voice.Conference;
import com.twilio.twiml.voice.Dial;
import com.twilio.twiml.VoiceResponse;
import com.twilio.twiml.TwiMLException;
import java.util.Arrays;

public class Example {
    public static void main(String[] args) {
        Conference conference = new Conference.Builder("EventedConf")
            .statusCallback("https://myapp.com/events")
            .statusCallbackEvents(Arrays.asList(Conference.Event.START,
            Conference.Event.END, Conference.Event.JOIN, Conference.Event.LEAVE,
            Conference.Event.MUTE, Conference.Event.HOLD)).build();
        Dial dial = new Dial.Builder().conference(conference).build();
        VoiceResponse response = new VoiceResponse.Builder().dial(dial).build();

        try {
            System.out.println(response.toXml());
        } catch (TwiMLException e) {
            e.printStackTrace();
        }
    }
}
