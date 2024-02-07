import com.twilio.twiml.voice.Pay;
import com.twilio.twiml.VoiceResponse;
import com.twilio.twiml.voice.Say;
import com.twilio.twiml.TwiMLException;


public class Example {
    public static void main(String[] args) {
        Say say = new Say.Builder("Calling Twilio Pay").build();
        Pay pay = new Pay.Builder().chargeAmount("20.45")
            .action("https://enter-your-callback-function-url.twil.io/pay")
            .build();
        VoiceResponse response = new VoiceResponse.Builder().say(say).pay(pay)
            .build();

        try {
            System.out.println(response.toXml());
        } catch (TwiMLException e) {
            e.printStackTrace();
        }
    }
}
