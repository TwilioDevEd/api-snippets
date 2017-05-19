import com.twilio.twiml.Play;
import com.twilio.twiml.VoiceResponse;
import com.twilio.twiml.TwiMLException;
import com.twilio.twiml.Method;


public class Play2 {
    public static void main(String[] args) {
        Play play = new Play.Builder("https://api.twilio.com/cowbell.mp3").build();
        VoiceResponse response = new VoiceResponse.Builder().play(play).build();

        try {
            System.out.println(response.toXml());
        } catch (TwiMLException e) {
            e.printStackTrace();
        }
    }
}