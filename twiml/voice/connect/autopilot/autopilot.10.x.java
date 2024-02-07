import com.twilio.twiml.voice.Autopilot;
import com.twilio.twiml.voice.Connect;
import com.twilio.twiml.VoiceResponse;
import com.twilio.twiml.TwiMLException;


public class Example {
    public static void main(String[] args) {
        Autopilot autopilot = new Autopilot
            .Builder("UAXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX").build();
        Connect connect = new Connect.Builder().autopilot(autopilot).build();
        VoiceResponse response = new VoiceResponse.Builder().connect(connect)
            .build();

        try {
            System.out.println(response.toXml());
        } catch (TwiMLException e) {
            e.printStackTrace();
        }
    }
}
