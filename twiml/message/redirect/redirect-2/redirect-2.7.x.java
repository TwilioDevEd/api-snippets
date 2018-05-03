import com.twilio.twiml.voice.Redirect;
import com.twilio.twiml.VoiceResponse;
import com.twilio.twiml.TwiMLException;


public class Example {
    public static void main(String[] args) {
        Redirect redirect = new Redirect.Builder("../nextInstructions")
            .build();
        VoiceResponse response = new VoiceResponse.Builder().redirect(redirect)
            .build();

        try {
            System.out.println(response.toXml());
        } catch (TwiMLException e) {
            e.printStackTrace();
        }
    }
}
