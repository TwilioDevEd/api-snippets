import com.twilio.twiml.VoiceResponse;
import com.twilio.twiml.Say;
import com.twilio.twiml.TwiMLException;
import com.twilio.twiml.Method;


public class Say-1.7.x {
    public static void main(String[] args) {
        Say say = new Say.Builder("Chapeau!").voice("woman").language("fr").build();
        VoiceResponse response = new VoiceResponse.Builder().say(say).build();
        try {
            System.out.println(response.toXml());
        } catch (TwiMLException e) {
            e.printStackTrace();
        }
    }
}