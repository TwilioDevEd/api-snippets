import com.twilio.twiml.Dial;
import com.twilio.twiml.VoiceResponse;
import com.twilio.twiml.Sip;
import com.twilio.twiml.TwiMLException;
import com.twilio.twiml.Method;


public class Sip2 {
    public static void main(String[] args) {
        Sip sip = new Sip.Builder("sip:kate@example.com").username("admin")
            .password("1234").build();
        Dial dial = new Dial.Builder().sip(sip).build();
        VoiceResponse response = new VoiceResponse.Builder().dial(dial).build();

        try {
            System.out.println(response.toXml());
        } catch (TwiMLException e) {
            e.printStackTrace();
        }
    }
}
