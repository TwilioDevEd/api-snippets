import com.twilio.twiml.voice.Pause;
import com.twilio.twiml.VoiceResponse;
import com.twilio.twiml.voice.Say;
import com.twilio.twiml.TwiMLException;


public class Example {
    public static void main(String[] args) {
        Pause pause = new Pause.Builder().length(5).build();
        Say say = new Say.Builder("Hi there.").build();
        VoiceResponse response = new VoiceResponse.Builder().pause(pause)
            .say(say).build();

        try {
            System.out.println(response.toXml());
        } catch (TwiMLException e) {
            e.printStackTrace();
        }
    }
}
