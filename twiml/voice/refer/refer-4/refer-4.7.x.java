import com.twilio.twiml.voice.Refer;
import com.twilio.twiml.voice.ReferSip;
import com.twilio.twiml.VoiceResponse;
import com.twilio.twiml.TwiMLException;
import com.twilio.http.HttpMethod;

public class Example {
    public static void main(String[] args) {
        ReferSip sip = new ReferSip.Builder("sip:alice@example.com").build();
        Refer refer = new Refer.Builder().action("/handleRefer").method(HttpMethod.POST).referSip(number).build();
        VoiceResponse response = new VoiceResponse.Builder().refer(refer).build();

        try {
            System.out.println(response.toXml());
        } catch (TwiMLException e) {
            e.printStackTrace();
        }
    }
}
