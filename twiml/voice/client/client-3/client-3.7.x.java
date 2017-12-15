import com.twilio.twiml.Client;
import com.twilio.twiml.Dial;
import com.twilio.twiml.VoiceResponse;
import com.twilio.twiml.TwiMLException;
import java.util.Arrays;
import com.twilio.twiml.Event;
import com.twilio.twiml.Method;

public class Example {
    public static void main(String[] args) {
        Client client = new Client.Builder("joey")
            .statusCallback("https://myapp.com/calls/events")
            .statusCallbackMethod(Method.POST).statusCallbackEvents(Arrays
            .asList(Event.INITIATED, Event.RINGING, Event.ANSWERED, Event
            .COMPLETED)).build();
        Dial dial = new Dial.Builder().client(client).build();
        VoiceResponse response = new VoiceResponse.Builder().dial(dial).build();

        try {
            System.out.println(response.toXml());
        } catch (TwiMLException e) {
            e.printStackTrace();
        }
    }
}
