import com.twilio.twiml.voice.Dial;
import com.twilio.twiml.VoiceResponse;
import com.twilio.twiml.voice.Sip;
import com.twilio.twiml.TwiMLException;
import java.util.Arrays;
import com.twilio.http.HttpMethod;

public class Example {
    public static void main(String[] args) {
        Sip sip = new Sip.Builder("sip:kate@example.com")
            .statusCallback("https://myapp.com/calls/events")
            .statusCallbackMethod(HttpMethod.POST).statusCallbackEvents(Arrays
            .asList(Sip.Event.INITIATED, Sip.Event.RINGING, Sip.Event.ANSWERED,
            Sip.Event.COMPLETED)).build();
        Dial dial = new Dial.Builder().sip(sip).build();
        VoiceResponse response = new VoiceResponse.Builder().dial(dial).build();

        try {
            System.out.println(response.toXml());
        } catch (TwiMLException e) {
            e.printStackTrace();
        }
    }
}
