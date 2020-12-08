import com.twilio.twiml.voice.Dial;
import com.twilio.twiml.voice.Number;
import com.twilio.twiml.VoiceResponse;
import com.twilio.twiml.voice.Sip;
import com.twilio.twiml.TwiMLException;


public class Example {
    public static void main(String[] args) {
        Number number = new Number.Builder("+12143211432").build();
        Sip sip = new Sip.Builder("sip:alice-desk-phone@example.com").build();
        Sip sip2 = new Sip.Builder("sip:alice-soft-phone@example.com").build();
        Sip sip3 = new Sip.Builder("sip:alice-mobile-client@example.com").build();
        Dial dial = new Dial.Builder().number(number).sip(sip2).sip(sip).sip(sip3).build();
        VoiceResponse response = new VoiceResponse.Builder().dial(dial).build();

        try {
            System.out.println(response.toXml());
        } catch (TwiMLException e) {
            e.printStackTrace();
        }
    }
}
