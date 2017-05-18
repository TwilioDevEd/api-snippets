import com.twilio.twiml.Enqueue;
import com.twilio.twiml.VoiceResponse;
import com.twilio.twiml.TwiMLException;
import com.twilio.twiml.Method;


public class Enqueue-1.7.x {
    public static void main(String[] args) {
        Enqueue enqueue = new Enqueue.Builder("support").waitUrl("wait-music.xml").build();
        VoiceResponse response = new VoiceResponse.Builder().enqueue(enqueue).build();
        try {
            System.out.println(response.toXml());
        } catch (TwiMLException e) {
            e.printStackTrace();
        }
    }
}