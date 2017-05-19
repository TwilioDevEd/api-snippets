import com.twilio.twiml.Client;
import com.twilio.twiml.Dial;
import com.twilio.twiml.Number;
import com.twilio.twiml.VoiceResponse;
import com.twilio.twiml.TwiMLException;
import com.twilio.twiml.Method;


public class Client2 {
    public static void main(String[] args) {
        Number number = new Number.Builder("858-987-6543").build();
        Client client = new Client.Builder("jenny").build();
        Client client = new Client.Builder("tommy").build();
        Dial dial = new Dial.Builder().callerId("+1888XXXXXXX").number(number).client(client).client(client).build();
        VoiceResponse response = new VoiceResponse.Builder().dial(dial).build();

        try {
            System.out.println(response.toXml());
        } catch (TwiMLException e) {
            e.printStackTrace();
        }
    }
}
