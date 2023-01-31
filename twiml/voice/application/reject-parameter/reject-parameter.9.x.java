import com.twilio.twiml.voice.Parameter;
import com.twilio.twiml.voice.Reject;
import com.twilio.twiml.VoiceResponse;
import com.twilio.twiml.TwiMLException;


public class Example {
    public static void main(String[] args) {
        Parameter parameter = new Parameter.Builder().name("reject_reason").value("no agents available").build();
        Reject reject = new Reject.Builder().parameter(parameter).build();
        VoiceResponse response = new VoiceResponse.Builder().reject(reject).build();

        try {
            System.out.println(response.toXml());
        } catch (TwiMLException e) {
            e.printStackTrace();
        }
    }
}
