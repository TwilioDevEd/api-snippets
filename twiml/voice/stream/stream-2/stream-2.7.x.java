import com.twilio.twiml.voice.Parameter;
import com.twilio.twiml.VoiceResponse;
import com.twilio.twiml.voice.Start;
import com.twilio.twiml.voice.Stream;
import com.twilio.twiml.TwiMLException;


public class Example {
    public static void main(String[] args) {
        Parameter parameter = new Parameter.Builder().name("FirstName").value("Jane").build();
        Parameter parameter2 = new Parameter.Builder().name("LastName").value("Doe").build();
        Stream stream = new Stream.Builder().url("wss://mystream.ngrok.io/example").parameter(parameter).parameter(parameter2).build();
        Start start = new Start.Builder().stream(stream).build();
        VoiceResponse response = new VoiceResponse.Builder().start(start).build();

        try {
            System.out.println(response.toXml());
        } catch (TwiMLException e) {
            e.printStackTrace();
        }
    }
}
