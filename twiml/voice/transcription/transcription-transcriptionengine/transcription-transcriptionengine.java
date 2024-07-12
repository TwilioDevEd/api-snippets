import com.twilio.twiml.VoiceResponse;
import com.twilio.twiml.voice.Start;
import com.twilio.twiml.voice.Transcription;
import com.twilio.twiml.TwiMLException;


public class Example {
    public static void main(String[] args) {
        Transcription transcription = new Transcription.Builder().statusCallbackUrl("https://example.com/your-callback-url").transcriptionEngine("google").build();
        Start start = new Start.Builder().transcription(transcription).build();
        VoiceResponse response = new VoiceResponse.Builder().start(start).build();

        try {
            System.out.println(response.toXml());
        } catch (TwiMLException e) {
            e.printStackTrace();
        }
    }
}
