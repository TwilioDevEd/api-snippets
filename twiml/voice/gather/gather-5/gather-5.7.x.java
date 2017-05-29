import com.twilio.twiml.Gather;
import com.twilio.twiml.Redirect;
import com.twilio.twiml.VoiceResponse;
import com.twilio.twiml.Say;
import com.twilio.twiml.TwiMLException;
import com.twilio.twiml.Method;


public class Example {
    public static void main(String[] args) {
        Say say = new Say.Builder("Enter something, or not").build();
        Gather gather = new Gather.Builder().method(Method.GET)
            .action("/process_gather.php").say(say).build();
        Redirect redirect = new Redirect.Builder().method(Method.GET)
            .url("/process_gather.php?Digits=TIMEOUT").build();
        VoiceResponse response = new VoiceResponse.Builder().gather(gather)
            .redirect(redirect).build();

        try {
            System.out.println(response.toXml());
        } catch (TwiMLException e) {
            e.printStackTrace();
        }
    }
}
