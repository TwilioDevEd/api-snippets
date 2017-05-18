import com.twilio.twiml.Record;
import com.twilio.twiml.VoiceResponse;
import com.twilio.twiml.Say;
import com.twilio.twiml.TwiMLException;
import com.twilio.twiml.Method;


public class Record-3.7.x {
    public static void main(String[] args) {
        Say say = new Say.Builder("Please leave a message at the beep.\nPress the star key when finished.").build();
        Say say = new Say.Builder("I did not receive a recording").build();
        Record record = new Record.Builder().action("http://foo.edu/handleRecording.php").method(Method.GET).maxLength(20).finishOnKey("*").build();
        VoiceResponse response = new VoiceResponse.Builder().say(say).record(record).say(say).build();
        try {
            System.out.println(response.toXml());
        } catch (TwiMLException e) {
            e.printStackTrace();
        }
    }
}