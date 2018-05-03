import com.twilio.twiml.voice.Record;
import com.twilio.twiml.VoiceResponse;
import com.twilio.twiml.voice.Say;
import com.twilio.twiml.TwiMLException;
import com.twilio.http.HttpMethod;

public class Example {
    public static void main(String[] args) {
        Say say = new Say
            .Builder("Please leave a message at the beep.\nPress the star key when finished.").build();
        Say say2 = new Say.Builder("I did not receive a recording").build();
        Record record = new Record.Builder()
            .action("http://foo.edu/handleRecording.php").method(HttpMethod.GET)
            .maxLength(20).finishOnKey("*").build();
        VoiceResponse response = new VoiceResponse.Builder().say(say)
            .record(record).say(say2).build();

        try {
            System.out.println(response.toXml());
        } catch (TwiMLException e) {
            e.printStackTrace();
        }
    }
}
