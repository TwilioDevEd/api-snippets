import com.twilio.twiml.voice.Client;
import com.twilio.twiml.voice.Dial;
import com.twilio.twiml.voice.Number;
import com.twilio.twiml.VoiceResponse;
import com.twilio.twiml.TwiMLException;


public class Example {
    public static void main(String[] args) {
        Number number = new Number.Builder("858-987-6543").build();
        Client client = new Client.Builder("tommy").build();
        Client client2 = new Client.Builder("jenny").build();
        Dial dial = new Dial.Builder().callerId("+1888XXXXXXX").number(number)
            .client(client2).client(client).build();
        VoiceResponse response = new VoiceResponse.Builder().dial(dial).build();

        try {
            System.out.println(response.toXml());
        } catch (TwiMLException e) {
            e.printStackTrace();
        }
    }
}
