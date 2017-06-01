import com.twilio.twiml.Dial;
import com.twilio.twiml.Number;
import com.twilio.twiml.VoiceResponse;
import com.twilio.twiml.Say;
import com.twilio.twiml.TwiMLException;
import com.twilio.twiml.Method;

public class Example {
    public static void main(String[] args) {
        Number number = new Number.Builder("415-123-4567").build();
        Dial dial = new Dial.Builder().action("/handleDialCallStatus.php")
            .method(Method.GET).number(number).build();
        Say say = new Say.Builder("I am unreachable").build();
        VoiceResponse response = new VoiceResponse.Builder().dial(dial)
            .say(say).build();

        try {
            System.out.println(response.toXml());
        } catch (TwiMLException e) {
            e.printStackTrace();
        }
    }
}
