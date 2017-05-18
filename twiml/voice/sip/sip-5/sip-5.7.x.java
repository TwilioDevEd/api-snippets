import com.twilio.twiml.Dial;
import com.twilio.twiml.VoiceResponse;
import com.twilio.twiml.Sip;
import com.twilio.twiml.TwiMLException;
import com.twilio.twiml.Method;


public class Sip-5.7.x {
    public static void main(String[] args) {
        Sip sip = new Sip.Builder("sip:jack@example.com;transport=tls").build();
        Dial dial = new Dial.Builder().sip(sip).build();
        VoiceResponse response = new VoiceResponse.Builder().dial(dial).build();
        try {
            System.out.println(response.toXml());
        } catch (TwiMLException e) {
            e.printStackTrace();
        }
    }
}