import com.twilio.twiml.voice.Play;
import com.twilio.twiml.VoiceResponse;
import com.twilio.twiml.voice.Say;
import com.twilio.twiml.TwiMLException;


public class Example {
    public static void main(String[] args) {
        Say say = new Say.Builder("Hello World").build();
        Play play = new Play.Builder("https://api.twilio.com/Cowbell.mp3")
            .build();
        VoiceResponse response = new VoiceResponse.Builder().say(say)
            .play(play).build();

        try {
            System.out.println(response.toXml());
        } catch (TwiMLException e) {
            e.printStackTrace();
        }
    }
}
