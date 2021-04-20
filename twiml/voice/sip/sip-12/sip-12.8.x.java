import com.twilio.twiml.voice.Dial;
import com.twilio.twiml.VoiceResponse;
import com.twilio.twiml.voice.Sip;
import com.twilio.twiml.TwiMLException;


public class Example {
    public static void main(String[] args) {
        Sip sip = new Sip.Builder("sip:alice@example.com").build();
        Sip sip2 = new Sip.Builder("sip:charlie@example.com").build();
        Sip sip3 = new Sip.Builder("sip:bob@example.com").build();
        Dial dial = new Dial.Builder().sequential(true).sip(sip).sip(sip3)
            .sip(sip2).build();
        VoiceResponse response = new VoiceResponse.Builder().dial(dial).build();

        try {
            System.out.println(response.toXml());
        } catch (TwiMLException e) {
            e.printStackTrace();
        }
    }
}
