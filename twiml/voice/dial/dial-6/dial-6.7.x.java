import com.twilio.twiml.Conference;
import com.twilio.twiml.Dial;
import com.twilio.twiml.VoiceResponse;
import com.twilio.twiml.TwiMLException;
import com.twilio.twiml.Method;


public class Dial6 {
    public static void main(String[] args) {
        Conference conference = new Conference.Builder("myteamroom").build();
        Dial dial = new Dial.Builder().record("record-from-ringing-dual").recordingStatusCallback("www.myexample.com").conference(conference).build();
        VoiceResponse response = new VoiceResponse.Builder().dial(dial).build();

        try {
            System.out.println(response.toXml());
        } catch (TwiMLException e) {
            e.printStackTrace();
        }
    }
}
