import com.twilio.twiml.voice.Dial;
import com.twilio.twiml.voice.Number;
import com.twilio.twiml.VoiceResponse;
import com.twilio.twiml.TwiMLException;


public class Example {
    public static void main(String[] args) {
        Number number = new Number.Builder("858-987-6543").build();
        Number number2 = new Number.Builder("619-765-4321").build();
        Number number3 = new Number.Builder("415-123-4567").build();
        Dial dial = new Dial.Builder().number(number).number(number3)
            .number(number2).build();
        VoiceResponse response = new VoiceResponse.Builder().dial(dial).build();

        try {
            System.out.println(response.toXml());
        } catch (TwiMLException e) {
            e.printStackTrace();
        }
    }
}
