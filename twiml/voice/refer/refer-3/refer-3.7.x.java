import com.twilio.twiml.voice.Refer;
import com.twilio.twiml.voice.ReferSip;
import com.twilio.twiml.VoiceResponse;
import com.twilio.twiml.TwiMLException;


public class Example {
    public static void main(String[] args) {
        ReferSip sip = new ReferSip.Builder("sip:alice@example.com?User-to-User=123456789%3Bencoding%3Dhex").build();
        Refer refer = new Refer.Builder().referSip(number).build();
        VoiceResponse response = new VoiceResponse.Builder().refer(refer).build();

        try {
            System.out.println(response.toXml());
        } catch (TwiMLException e) {
            e.printStackTrace();
        }
    }
}
