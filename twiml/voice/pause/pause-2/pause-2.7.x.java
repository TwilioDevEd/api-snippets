import com.twilio.twiml.Pause;
import com.twilio.twiml.VoiceResponse;
import com.twilio.twiml.Say;
import com.twilio.twiml.TwiMLException;
import com.twilio.twiml.Method;


public class Pause-2.7.x {
    public static void main(String[] args) {
        Pause pause = new Pause.Builder().length(5).build();
        Say say = new Say.Builder("Hi there.").build();
        VoiceResponse response = new VoiceResponse.Builder().pause(pause).say(say).build();
        try {
            System.out.println(response.toXml());
        } catch (TwiMLException e) {
            e.printStackTrace();
        }
    }
}