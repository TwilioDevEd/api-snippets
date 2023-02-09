import com.twilio.twiml.voice.Record;
import com.twilio.twiml.VoiceResponse;
import com.twilio.twiml.TwiMLException;


public class Example {
    public static void main(String[] args) {
        Record record = new Record.Builder().timeout(10).transcribe(true)
            .build();
        VoiceResponse response = new VoiceResponse.Builder().record(record)
            .build();

        try {
            System.out.println(response.toXml());
        } catch (TwiMLException e) {
            e.printStackTrace();
        }
    }
}
