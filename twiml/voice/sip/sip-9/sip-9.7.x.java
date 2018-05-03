import com.twilio.twiml.voice.Dial;
import com.twilio.twiml.VoiceResponse;
import com.twilio.twiml.voice.Sip;
import com.twilio.twiml.TwiMLException;
import com.twilio.http.HttpMethod;

public class Example {
    public static void main(String[] args) {
        Sip sip = new Sip.Builder("sip:kate@example.com?customheader=foo")
            .method(HttpMethod.POST).url("/handle_screening_on_answer").build();
        Dial dial = new Dial.Builder().record(Dial.Record.RECORD_FROM_ANSWER)
            .timeout(10).hangupOnStar(true).callerId("bob").method(HttpMethod.POST)
            .action("/handle_post_dial").sip(sip).build();
        VoiceResponse response = new VoiceResponse.Builder().dial(dial).build();

        try {
            System.out.println(response.toXml());
        } catch (TwiMLException e) {
            e.printStackTrace();
        }
    }
}
