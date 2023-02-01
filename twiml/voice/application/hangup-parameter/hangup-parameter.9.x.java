import com.twilio.twiml.voice.Hangup;
import com.twilio.twiml.voice.Parameter;
import com.twilio.twiml.VoiceResponse;
import com.twilio.twiml.TwiMLException;


public class Example {
    public static void main(String[] args) {
        Parameter parameter = new Parameter.Builder().name("hangup_reason").value("no agents available").build();
        Hangup hangup = new Hangup.Builder().parameter(parameter).build();
        VoiceResponse response = new VoiceResponse.Builder().hangup(hangup).build();

        try {
            System.out.println(response.toXml());
        } catch (TwiMLException e) {
            e.printStackTrace();
        }
    }
}
