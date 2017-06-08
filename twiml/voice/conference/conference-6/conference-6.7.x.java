import com.twilio.twiml.Conference;
import com.twilio.twiml.Dial;
import com.twilio.twiml.VoiceResponse;
import com.twilio.twiml.TwiMLException;
import com.twilio.twiml.Language;

public class Example {
    public static void main(String[] args) {
        Conference conference = new Conference.Builder("NoMusicNoBeepRoom")
            .beep(Conference.Beep.FALSE).waitUrl("http://your-webhook-host.com")
            .startConferenceOnEnter(true).endConferenceOnExit(true).build();
        Dial dial = new Dial.Builder().conference(conference).build();
        VoiceResponse response = new VoiceResponse.Builder().dial(dial).build();

        try {
            System.out.println(response.toXml());
        } catch (TwiMLException e) {
            e.printStackTrace();
        }
    }
}
