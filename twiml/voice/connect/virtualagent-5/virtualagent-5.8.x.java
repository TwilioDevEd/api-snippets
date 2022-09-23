import com.twilio.twiml.voice.Connect;
import com.twilio.twiml.voice.Parameter;
import com.twilio.twiml.VoiceResponse;
import com.twilio.twiml.voice.VirtualAgent;
import com.twilio.twiml.TwiMLException;


public class Example {
    public static void main(String[] args) {
        Parameter parameter = new Parameter.Builder().name("customer_name").value("Burton Guster").build();
        VirtualAgent virtualagent = new VirtualAgent.Builder().connectorName("uniqueName").parameter(parameter).build();
        Connect connect = new Connect.Builder().virtualAgent(virtualagent).build();
        VoiceResponse response = new VoiceResponse.Builder().connect(connect).build();

        try {
            System.out.println(response.toXml());
        } catch (TwiMLException e) {
            e.printStackTrace();
        }
    }
}
