import com.twilio.twiml.voice.Pay;
import com.twilio.twiml.voice.Prompt;
import com.twilio.twiml.VoiceResponse;
import com.twilio.twiml.voice.Say;
import com.twilio.twiml.TwiMLException;
import java.util.Arrays;

public class Example {
    public static void main(String[] args) {
        Say say = new Say
            .Builder("Please enter your expiration date, two digits for the month and two digits for the year.").build();
        Prompt prompt = new Prompt.Builder().attempts(1).for_(Prompt.For
            .EXPIRATION_DATE).say(say).build();
        Say say2 = new Say
            .Builder("Please enter your expiration date, two digits for the month and two digits for the year. For example, if your expiration date is March 2022, then please enter 0 3 2 2").build();
        Prompt prompt2 = new Prompt.Builder().attempts(Arrays.asList(2, 3))
            .for_(Prompt.For.EXPIRATION_DATE).say(say2).build();
        Pay pay = new Pay.Builder().prompt(prompt).prompt(prompt2).build();
        VoiceResponse response = new VoiceResponse.Builder().pay(pay).build();

        try {
            System.out.println(response.toXml());
        } catch (TwiMLException e) {
            e.printStackTrace();
        }
    }
}
