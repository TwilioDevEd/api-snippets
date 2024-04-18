import com.twilio.twiml.VoiceResponse;
import com.twilio.twiml.voice.Say;
import com.twilio.twiml.voice.Start;
import com.twilio.twiml.voice.Stream;
import com.twilio.twiml.TwiMLException;


public class Example {
    public static void main(String[] args) {
        Stream stream = new Stream.Builder().name("Example Audio Stream").url("wss://example.com/audiostream").build();
        Start start = new Start.Builder().stream(stream).build();
        Say say = new Say.Builder("The stream has started.").build();
        VoiceResponse response = new VoiceResponse.Builder().start(start).say(say).build();

        try {
            System.out.println(response.toXml());
        } catch (TwiMLException e) {
            e.printStackTrace();
        }
    }
}
