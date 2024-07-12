import com.twilio.twiml.VoiceResponse;
import com.twilio.twiml.voice.Stop;
import com.twilio.twiml.voice.Transcription;
import com.twilio.twiml.TwiMLException;


public class Example {
    public static void main(String[] args) {
        Transcription transcription = new Transcription.Builder().name("Contact center transcription").build();
        Stop stop = new Stop.Builder().transcription(transcription).build();
        VoiceResponse response = new VoiceResponse.Builder().stop(stop).build();

        try {
            System.out.println(response.toXml());
        } catch (TwiMLException e) {
            e.printStackTrace();
        }
    }
}
