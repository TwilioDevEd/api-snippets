import com.twilio.twiml.Conference;
import com.twilio.twiml.Dial;
import com.twilio.twiml.VoiceResponse;
import com.twilio.twiml.TwiMLException;
import com.twilio.twiml.Method;


public class Conference-7.7.x {
    public static void main(String[] args) {
        Conference conference = new Conference.Builder("Customer Waiting Room").beep("false").build();
        Dial dial = new Dial.Builder().conference(conference).build();
        VoiceResponse response = new VoiceResponse.Builder().dial(dial).build();
        try {
            System.out.println(response.toXml());
        } catch (TwiMLException e) {
            e.printStackTrace();
        }
    }
}