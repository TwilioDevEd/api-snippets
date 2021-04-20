import com.twilio.twiml.VoiceResponse;
import com.twilio.twiml.voice.Start;
import com.twilio.twiml.voice.Stream;
import com.twilio.twiml.TwiMLException;


public class Example {
    public static void main(String[] args) {
        Stream stream = new Stream.Builder().name("Example Audio Stream")
            .url("wss://mystream.ngrok.io/audiostream").build();
        Start start = new Start.Builder().stream(stream).build();
        VoiceResponse response = new VoiceResponse.Builder().start(start)
            .build();

        try {
            System.out.println(response.toXml());
        } catch (TwiMLException e) {
            e.printStackTrace();
        }
    }
}
