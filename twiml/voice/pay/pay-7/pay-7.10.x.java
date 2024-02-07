import com.twilio.twiml.voice.Pay;
import com.twilio.twiml.voice.Prompt;
import com.twilio.twiml.VoiceResponse;
import com.twilio.twiml.voice.Say;
import com.twilio.twiml.TwiMLException;


public class Example {
    public static void main(String[] args) {
        Say say = new Say
            .Builder("Please enter security code for your American Express card. It’s the 4 digits located on the front of your card").build();
        Prompt prompt = new Prompt.Builder().cardTypes(Prompt.CardType.AMEX)
            .for_(Prompt.For.SECURITY_CODE).say(say).build();
        Pay pay = new Pay.Builder().prompt(prompt).build();
        VoiceResponse response = new VoiceResponse.Builder().pay(pay).build();

        try {
            System.out.println(response.toXml());
        } catch (TwiMLException e) {
            e.printStackTrace();
        }
    }
}
