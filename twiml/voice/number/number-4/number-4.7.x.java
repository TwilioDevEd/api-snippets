import com.twilio.twiml.voice.Dial;
import com.twilio.twiml.voice.Number;
import com.twilio.twiml.VoiceResponse;
import com.twilio.twiml.TwiMLException;
import com.twilio.http.HttpMethod;
import java.util.Arrays;

public class Example {
    public static void main(String[] args) {
        Number number = new Number.Builder("+14155555555")
            .statusCallback("https://myapp.com/calls/events")
            .statusCallbackMethod(HttpMethod.POST).statusCallbackEvents(Arrays
            .asList(Number.Event.INITIATED, Number.Event.RINGING, Number.Event
            .ANSWERED, Number.Event.COMPLETED)).build();
        Number number2 = new Number.Builder("+14153333333")
            .statusCallback("https://example.com/events")
            .statusCallbackMethod(HttpMethod.POST).statusCallbackEvents(Arrays
            .asList(Number.Event.INITIATED, Number.Event.RINGING, Number.Event
            .ANSWERED, Number.Event.COMPLETED)).build();
        Dial dial = new Dial.Builder().number(number).number(number2).build();
        VoiceResponse response = new VoiceResponse.Builder().dial(dial).build();

        try {
            System.out.println(response.toXml());
        } catch (TwiMLException e) {
            e.printStackTrace();
        }
    }
}
