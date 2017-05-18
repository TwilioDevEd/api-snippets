import com.twilio.twiml.Conference;
import com.twilio.twiml.Dial;
import com.twilio.twiml.VoiceResponse;
import com.twilio.twiml.TwiMLException;
import com.twilio.twiml.Method;


public class Conference-9.7.x {
    public static void main(String[] args) {
        Conference conference = new Conference.Builder("LoveTwilio").build();
        Dial dial = new Dial.Builder().action("handleLeaveConference.php").method(Method.POST).hangupOnStar("true").timeLimit(30).conference(conference).build();
        VoiceResponse response = new VoiceResponse.Builder().dial(dial).build();
        try {
            System.out.println(response.toXml());
        } catch (TwiMLException e) {
            e.printStackTrace();
        }
    }
}