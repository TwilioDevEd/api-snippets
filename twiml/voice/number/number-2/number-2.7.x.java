import com.twilio.twiml.Dial;
import com.twilio.twiml.Number;
import com.twilio.twiml.VoiceResponse;
import com.twilio.twiml.TwiMLException;
import com.twilio.twiml.Method;


public class Number2 {
    public static void main(String[] args) {
        Number number = new Number.Builder("858-987-6543").build();
        Number number = new Number.Builder("415-123-4567").build();
        Number number = new Number.Builder("619-765-4321").build();
        Dial dial = new Dial.Builder().number(number).number(number).number(number).build();
        VoiceResponse response = new VoiceResponse.Builder().dial(dial).build();

        try {
            System.out.println(response.toXml());
        } catch (TwiMLException e) {
            e.printStackTrace();
        }
    }
}
