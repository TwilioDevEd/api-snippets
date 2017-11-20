import com.twilio.twiml.TwiMLException;
import com.twilio.twiml.voice.Say;
import com.twilio.twiml.voice.Say.Language;
import com.twilio.twiml.VoiceResponse;

public class Example {
    public static void main(String[] args) {
        Say say = new Say.Builder("Chapeau!").voice(Say.Voice.ALICE)
            .language(Language.FR_FR).build();
        VoiceResponse response = new VoiceResponse.Builder().say(say).build();

        try {
            System.out.println(response.toXml());
        } catch (TwiMLException e) {
            e.printStackTrace();
        }
    }
}
