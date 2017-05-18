import com.twilio.twiml.Client;
import com.twilio.twiml.Dial;
import com.twilio.twiml.VoiceResponse;
import com.twilio.twiml.TwiMLException;
import com.twilio.twiml.Method;


public class Client-3.7.x {
    public static void main(String[] args) {
        Client client = new Client.Builder("jenny").statusCallbackEvent("initiated ringing answered completed").statusCallback("https://myapp.com/calls/events").statusCallbackMethod("POST").build();
        Dial dial = new Dial.Builder().client(client).build();
        VoiceResponse response = new VoiceResponse.Builder().dial(dial).build();
        try {
            System.out.println(response.toXml());
        } catch (TwiMLException e) {
            e.printStackTrace();
        }
    }
}