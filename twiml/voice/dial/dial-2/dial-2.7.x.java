import com.twilio.twiml.Dial;
import com.twilio.twiml.VoiceResponse;
import com.twilio.twiml.Say;
import com.twilio.twiml.TwiMLException;
import com.twilio.twiml.Method;


public class Dial-2.7.x {
    public static void main(String[] args) {
        Dial dial = new Dial.Builder("415-123-4567").build();
        Say say = new Say.Builder("Goodbye").build();
        VoiceResponse response = new VoiceResponse.Builder().dial(dial).say(say).build();

        try {
            System.out.println(response.toXml());
        } catch (TwiMLException e) {
            e.printStackTrace();
        }
    }
}