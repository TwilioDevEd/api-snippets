import com.twilio.twiml.voice.Client;
import com.twilio.twiml.voice.Client.Event;
import com.twilio.twiml.voice.Dial;
import com.twilio.twiml.VoiceResponse;
import com.twilio.twiml.TwiMLException;
import java.util.Arrays;
import java.util.List;

import com.twilio.http.HttpMethod;

public class Example {
    public static void main(String[] args) {
        List<Event> events = Arrays.asList(
            Event.INITIATED,
            Event.RINGING,
            Event.ANSWERED,
            Event.COMPLETED
        );

        Client client = new Client.Builder("joey")
            .statusCallback("https://myapp.com/calls/events")
            .statusCallbackMethod(HttpMethod.POST)
            .statusCallbackEvents(events).build();

        Dial dial = new Dial.Builder().client(client).build();
        VoiceResponse response = new VoiceResponse.Builder().dial(dial).build();

        try {
            System.out.println(response.toXml());
        } catch (TwiMLException e) {
            e.printStackTrace();
        }
    }
}
