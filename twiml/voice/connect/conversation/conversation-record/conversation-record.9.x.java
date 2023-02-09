import com.twilio.twiml.voice.Connect;
import com.twilio.twiml.voice.Conversation;
import com.twilio.twiml.VoiceResponse;
import com.twilio.twiml.TwiMLException;


public class Example {
    public static void main(String[] args) {
        Conversation conversation = new Conversation.Builder().serviceInstanceSid("ISxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx").record(Conversation.Record
        .RECORD_FROM_ANSWER).build();
        Connect connect = new Connect.Builder().conversation(conversation).build();
        VoiceResponse response = new VoiceResponse.Builder().connect(connect).build();

        try {
            System.out.println(response.toXml());
        } catch (TwiMLException e) {
            e.printStackTrace();
        }
    }
}
