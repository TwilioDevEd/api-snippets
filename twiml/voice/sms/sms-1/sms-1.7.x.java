import com.twilio.twiml.VoiceResponse;
import com.twilio.twiml.voice.Sms;
import com.twilio.twiml.TwiMLException;


public class Example {
    public static void main(String[] args) {
        Sms sms = new Sms.Builder("The king stay the king.")
            .from("+14105551234").to("+14105556789").build();
        VoiceResponse response = new VoiceResponse.Builder().sms(sms).build();

        try {
            System.out.println(response.toXml());
        } catch (TwiMLException e) {
            e.printStackTrace();
        }
    }
}
