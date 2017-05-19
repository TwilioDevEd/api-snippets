import com.twilio.twiml.Dial;
import com.twilio.twiml.Queue;
import com.twilio.twiml.VoiceResponse;
import com.twilio.twiml.TwiMLException;
import com.twilio.twiml.Method;


public class Queue-1.7.x {
    public static void main(String[] args) {
        Queue queue = new Queue.Builder("support").url("about_to_connect.xml").build();
        Dial dial = new Dial.Builder().queue(queue).build();
        VoiceResponse response = new VoiceResponse.Builder().dial(dial).build();

        try {
            System.out.println(response.toXml());
        } catch (TwiMLException e) {
            e.printStackTrace();
        }
    }
}
