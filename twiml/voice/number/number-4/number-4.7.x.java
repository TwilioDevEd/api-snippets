import com.twilio.http.HttpMethod;
import com.twilio.twiml.TwiMLException;
import com.twilio.twiml.voice.Dial;
import com.twilio.twiml.voice.Number;
import com.twilio.twiml.voice.Number.Event;
import com.twilio.twiml.VoiceResponse;
import java.util.Arrays;

public class Example {
    public static void main(String[] args) {
        Number number = new Number.Builder("+14155555555")
            .statusCallback("https://myapp.com/calls/events")
            .statusCallbackMethod(HttpMethod.POST).statusCallbackEvents(Arrays
            .asList(Event.INITIATED, Event.RINGING, Event.ANSWERED, Event
            .COMPLETED)).build();
        Number number2 = new Number.Builder("+14153333333")
            .statusCallback("https://example.com/events")
            .statusCallbackMethod(HttpMethod.POST).statusCallbackEvents(Arrays
            .asList(Event.INITIATED, Event.RINGING, Event.ANSWERED, Event
            .COMPLETED)).build();
        Dial dial = new Dial.Builder().number(number).number(number2).build();
        VoiceResponse response = new VoiceResponse.Builder().dial(dial).build();

        try {
            System.out.println(response.toXml());
        } catch (TwiMLException e) {
            e.printStackTrace();
        }
    }
}
