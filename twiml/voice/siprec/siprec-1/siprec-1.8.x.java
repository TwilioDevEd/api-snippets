import com.twilio.twiml.VoiceResponse;
import com.twilio.twiml.voice.Siprec;
import com.twilio.twiml.voice.Start;
import com.twilio.twiml.TwiMLException;


public class Example {
    public static void main(String[] args) {
        Siprec siprec = new Siprec.Builder().name("My SIPREC Stream")
            .connectorName("Gridspace_1").build();
        Start start = new Start.Builder().siprec(siprec).build();
        VoiceResponse response = new VoiceResponse.Builder().start(start)
            .build();

        try {
            System.out.println(response.toXml());
        } catch (TwiMLException e) {
            e.printStackTrace();
        }
    }
}
