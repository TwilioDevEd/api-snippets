import com.twilio.twiml.Dial;
import com.twilio.twiml.VoiceResponse;
import com.twilio.twiml.Sip;
import com.twilio.twiml.TwiMLException;
import com.twilio.twiml.Method;


public class Sip-9.7.x {
    public static void main(String[] args) {
        Sip sip = new Sip.Builder("sip:kate@example.com?customheader=foo").method(Method.POST).url("/handle_screening_on_answer").build();
        Dial dial = new Dial.Builder().record("true").timeout(10).hangupOnStar("true").callerId("bob").method(Method.POST).action("/handle_post_dial").sip(sip).build();
        VoiceResponse response = new VoiceResponse.Builder().dial(dial).build();

        try {
            System.out.println(response.toXml());
        } catch (TwiMLException e) {
            e.printStackTrace();
        }
    }
}
