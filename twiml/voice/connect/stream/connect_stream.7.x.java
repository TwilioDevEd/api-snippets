import com.twilio.twiml.voice.Connect;
import com.twilio.twiml.VoiceResponse;
import com.twilio.twiml.voice.Say;
import com.twilio.twiml.voice.Stream;
import com.twilio.twiml.TwiMLException;


public class Example {
    public static void main(String[] args) {
        Stream stream = new Stream.Builder().url("wss://example.com/audiostream").build();
        Connect connect = new Connect.Builder().stream(stream).build();
        Say say = new Say.Builder("This TwiML instruction is unreachable unless the Stream is ended by your WebSocket server.").build();
        VoiceResponse response = new VoiceResponse.Builder().connect(connect).say(say).build();

        try {
            System.out.println(response.toXml());
        } catch (TwiMLException e) {
            e.printStackTrace();
        }
    }
}
