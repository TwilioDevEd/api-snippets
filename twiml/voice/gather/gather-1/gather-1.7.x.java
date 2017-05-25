import com.twilio.twiml.Gather;
import com.twilio.twiml.VoiceResponse;
import com.twilio.twiml.Say;
import com.twilio.twiml.TwiMLException;
import com.twilio.twiml.Method;


public class Gather1 {
    public static void main(String[] args) {
        Say say = new Say
            .Builder("Please enter your pin number and then press star.").build();
        Gather gather = new Gather.Builder().timeout(10).finishOnKey("*")
            .say(say).build();
        VoiceResponse response = new VoiceResponse.Builder().gather(gather)
            .build();

        try {
            System.out.println(response.toXml());
        } catch (TwiMLException e) {
            e.printStackTrace();
        }
    }
}
