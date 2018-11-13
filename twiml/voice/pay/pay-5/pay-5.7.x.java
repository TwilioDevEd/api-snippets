import com.twilio.twiml.voice.Pay;
import com.twilio.twiml.voice.Play;
import com.twilio.twiml.voice.Prompt;
import com.twilio.twiml.VoiceResponse;
import com.twilio.twiml.TwiMLException;


public class Example {
    public static void main(String[] args) {
        Play play = new Play
            .Builder("https://myurl.com/twilio/twiml/audio/card_number.mp3")
            .build();
        Prompt prompt = new Prompt.Builder().for_(Prompt.For
            .PAYMENT_CARD_NUMBER).play(play).build();
        Pay pay = new Pay.Builder().prompt(prompt).build();
        VoiceResponse response = new VoiceResponse.Builder().pay(pay).build();

        try {
            System.out.println(response.toXml());
        } catch (TwiMLException e) {
            e.printStackTrace();
        }
    }
}
