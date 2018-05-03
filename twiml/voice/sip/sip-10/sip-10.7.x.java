import com.twilio.twiml.voice.Dial;
import com.twilio.twiml.VoiceResponse;
import com.twilio.twiml.voice.Sip;
import com.twilio.twiml.TwiMLException;
import com.twilio.twiml.voice.Sip.Event;
import com.twilio.http.HttpMethod;
import java.util.Arrays;

public class Example {
    public static void main(String[] args) {
        Sip sip = new Sip.Builder("sip:kate@example.com")
            .statusCallback("https://myapp.com/calls/events")
            .statusCallbackMethod(HttpMethod.POST).statusCallbackEvents(Arrays
            .asList(Event.INITIATED, Event.RINGING, Event.ANSWERED, Event
            .COMPLETED)).build();
        Dial dial = new Dial.Builder().sip(sip).build();
        VoiceResponse response = new VoiceResponse.Builder().dial(dial).build();

        try {
            System.out.println(response.toXml());
        } catch (TwiMLException e) {
            e.printStackTrace();
        }
    }
}
