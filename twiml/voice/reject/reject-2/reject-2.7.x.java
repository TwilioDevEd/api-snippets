import com.twilio.twiml.voice.Reject;
import com.twilio.twiml.VoiceResponse;
import com.twilio.twiml.TwiMLException;

public class Example {
    public static void main(String[] args) {
        Reject reject = new Reject.Builder().reason(Reject.Reason.BUSY).build();
        VoiceResponse response = new VoiceResponse.Builder().reject(reject)
            .build();

        try {
            System.out.println(response.toXml());
        } catch (TwiMLException e) {
            e.printStackTrace();
        }
    }
}
