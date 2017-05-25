import com.twilio.twiml.Enqueue;
import com.twilio.twiml.VoiceResponse;
import com.twilio.twiml.Say;
import com.twilio.twiml.TwiMLException;
import com.twilio.twiml.Method;


public class Leave1 {
    public static void main(String[] args) {
        Enqueue enqueue = new Enqueue.Builder("support").waitUrl("wait.xml")
            .build();
        Say say = new Say.Builder("Unfortunately, the support line has" +
            " closed. Please call again tomorrow.").build();
        VoiceResponse response = new VoiceResponse.Builder().enqueue(enqueue)
            .say(say).build();

        try {
            System.out.println(response.toXml());
        } catch (TwiMLException e) {
            e.printStackTrace();
        }
    }
}
