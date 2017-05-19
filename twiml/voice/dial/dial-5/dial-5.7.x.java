import com.twilio.twiml.Dial;
import com.twilio.twiml.Number;
import com.twilio.twiml.VoiceResponse;
import com.twilio.twiml.TwiMLException;
import com.twilio.twiml.Method;


public class Dial-5.7.x {
    public static void main(String[] args) {
        Number number = new Number.Builder("+15558675309").build();
        Dial dial = new Dial.Builder().record("record-from-ringing-dual").recordingStatusCallback("www.myexample.com").number(number).build();
        VoiceResponse response = new VoiceResponse.Builder().dial(dial).build();

        try {
            System.out.println(response.toXml());
        } catch (TwiMLException e) {
            e.printStackTrace();
        }
    }
}