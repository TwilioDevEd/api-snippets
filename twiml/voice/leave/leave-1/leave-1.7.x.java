import com.twilio.twiml.voice.Enqueue;
import com.twilio.twiml.VoiceResponse;
import com.twilio.twiml.voice.Say;
import com.twilio.twiml.TwiMLException;


public class Example {
    public static void main(String[] args) {
        Enqueue enqueue = new Enqueue.Builder().waitUrl("wait.xml")
            .queueName("support").build();
        Say say = new Say
            .Builder("Unfortunately, the support line has closed. Please call again tomorrow.").build();
        VoiceResponse response = new VoiceResponse.Builder().enqueue(enqueue)
            .say(say).build();

        try {
            System.out.println(response.toXml());
        } catch (TwiMLException e) {
            e.printStackTrace();
        }
    }
}
