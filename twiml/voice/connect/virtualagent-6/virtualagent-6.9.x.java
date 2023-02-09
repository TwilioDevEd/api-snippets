import com.twilio.twiml.voice.Config;
import com.twilio.twiml.voice.Connect;
import com.twilio.twiml.VoiceResponse;
import com.twilio.twiml.voice.VirtualAgent;
import com.twilio.twiml.TwiMLException;


public class Example {
    public static void main(String[] args) {
        Config config = new Config.Builder().name("language").value("en-us").build();
        Config config2 = new Config.Builder().name("voiceName").value("en-US-Wavenet-C").build();
        VirtualAgent virtualagent = new VirtualAgent.Builder().connectorName("uniqueName").config(config).config(config2).build();
        Connect connect = new Connect.Builder().virtualAgent(virtualagent).build();
        VoiceResponse response = new VoiceResponse.Builder().connect(connect).build();

        try {
            System.out.println(response.toXml());
        } catch (TwiMLException e) {
            e.printStackTrace();
        }
    }
}
