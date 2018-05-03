import com.twilio.twiml.voice.Gather;
import com.twilio.twiml.VoiceResponse;
import com.twilio.twiml.voice.Say;
import com.twilio.twiml.TwiMLException;
import java.util.Arrays;


public class Example {
    public static void main(String[] args) {
        Say say = new Say.Builder("Please press 1 or say sales for sales.")
            .build();
        Gather gather = new Gather.Builder().inputs(
          Arrays.asList(Gather.Input.DTMF, Gather.Input.SPEECH))
            .timeout(3).numDigits(1).say(say).build();
        VoiceResponse response = new VoiceResponse.Builder().gather(gather)
            .build();

        try {
            System.out.println(response.toXml());
        } catch (TwiMLException e) {
            e.printStackTrace();
        }
    }
}
