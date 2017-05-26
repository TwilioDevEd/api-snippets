import com.twilio.twiml.Hangup;
import com.twilio.twiml.VoiceResponse;
import com.twilio.twiml.TwiMLException;
import com.twilio.twiml.Method;


public class Example {
    public static void main(String[] args) {
        Hangup hangup = new Hangup.Builder().build();
        VoiceResponse response = new VoiceResponse.Builder().hangup(hangup)
            .build();

        try {
            System.out.println(response.toXml());
        } catch (TwiMLException e) {
            e.printStackTrace();
        }
    }
}
