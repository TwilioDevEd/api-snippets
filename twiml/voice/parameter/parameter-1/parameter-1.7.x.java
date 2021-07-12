import com.twilio.twiml.voice.Client;
import com.twilio.twiml.voice.Dial;
import com.twilio.twiml.voice.Identity;
import com.twilio.twiml.voice.Parameter;
import com.twilio.twiml.VoiceResponse;
import com.twilio.twiml.TwiMLException;


public class Example {
    public static void main(String[] args) {
        Identity identity = new Identity.Builder("user_jane").build();
        Parameter parameter = new Parameter.Builder().name("FirstName").value("Jane").build();
        Parameter parameter2 = new Parameter.Builder().name("LastName").value("Doe").build();
        Client client = new Client.Builder().identity(identity).parameter(parameter).parameter(parameter2).build();
        Dial dial = new Dial.Builder().client(client).build();
        VoiceResponse response = new VoiceResponse.Builder().dial(dial).build();

        try {
            System.out.println(response.toXml());
        } catch (TwiMLException e) {
            e.printStackTrace();
        }
    }
}
