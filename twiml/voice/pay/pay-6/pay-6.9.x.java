import com.twilio.twiml.voice.Pay;
import com.twilio.twiml.voice.Prompt;
import com.twilio.twiml.VoiceResponse;
import com.twilio.twiml.voice.Say;
import com.twilio.twiml.TwiMLException;


public class Example {
    public static void main(String[] args) {
        Say say = new Say
            .Builder("Please enter your 16 digit Visa or Mastercard number.")
            .build();
        Prompt prompt = new Prompt.Builder().for_(Prompt.For
            .PAYMENT_CARD_NUMBER).say(say).build();
        Pay pay = new Pay.Builder().prompt(prompt).build();
        VoiceResponse response = new VoiceResponse.Builder().pay(pay).build();

        try {
            System.out.println(response.toXml());
        } catch (TwiMLException e) {
            e.printStackTrace();
        }
    }
}
