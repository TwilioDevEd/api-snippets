import com.twilio.twiml.Dial;
import com.twilio.twiml.Number;
import com.twilio.twiml.VoiceResponse;
import com.twilio.twiml.TwiMLException;
import com.twilio.twiml.Method;


public class Number-4.7.x {
    public static void main(String[] args) {
        Number number = new Number.Builder("+14155555555").statusCallbackEvent("initiated ringing answered completed").statusCallback("https://myapp.com/calls/events").statusCallbackMethod("POST").build();
        Number number = new Number.Builder("+14153333333").statusCallbackEvent("initiated ringing answered completed").statusCallback("https://example.com/events").statusCallbackMethod("POST").build();
        Dial dial = new Dial.Builder().number(number).number(number).build();
        VoiceResponse response = new VoiceResponse.Builder().dial(dial).build();
        try {
            System.out.println(response.toXml());
        } catch (TwiMLException e) {
            e.printStackTrace();
        }
    }
}