import com.twilio.twiml.voice.Gather;
import com.twilio.twiml.voice.Redirect;
import com.twilio.twiml.VoiceResponse;
import com.twilio.twiml.voice.Say;
import com.twilio.twiml.TwiMLException;
import com.twilio.http.HttpMethod;

public class Example {
    public static void main(String[] args) {
        Say say = new Say.Builder("Enter something, or not").build();
        Gather gather = new Gather.Builder().action("/process_gather.php")
            .method(HttpMethod.GET).say(say).build();
        Redirect redirect = new Redirect.Builder("/process_gather.php?Digits=TIMEOUT")
            .method(HttpMethod.GET)
            .build();
        VoiceResponse response = new VoiceResponse.Builder().gather(gather)
            .redirect(redirect).build();

        try {
            System.out.println(response.toXml());
        } catch (TwiMLException e) {
            e.printStackTrace();
        }
    }
}
