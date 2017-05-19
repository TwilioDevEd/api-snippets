import com.twilio.twiml.Leave;
import com.twilio.twiml.VoiceResponse;
import com.twilio.twiml.TwiMLException;
import com.twilio.twiml.Method;


public class Leave-3.7.x {
    public static void main(String[] args) {
        Leave leave = new Leave.Builder().build();
        VoiceResponse response = new VoiceResponse.Builder().leave(leave).build();

        try {
            System.out.println(response.toXml());
        } catch (TwiMLException e) {
            e.printStackTrace();
        }
    }
}