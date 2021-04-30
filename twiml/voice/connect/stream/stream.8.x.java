import com.twilio.twiml.voice.Connect;
import com.twilio.twiml.VoiceResponse;
import com.twilio.twiml.voice.Stream;
import com.twilio.twiml.TwiMLException;


public class Example {
    public static void main(String[] args) {
        Stream stream = new Stream.Builder()
            .url("wss://mystream.ngrok.io/audiostream").build();
        Connect connect = new Connect.Builder().stream(stream).build();
        VoiceResponse response = new VoiceResponse.Builder().connect(connect)
            .build();

        try {
            System.out.println(response.toXml());
        } catch (TwiMLException e) {
            e.printStackTrace();
        }
    }
}
