import com.twilio.twiml.voice.Hangup;
import com.twilio.twiml.voice.Parameter;
import com.twilio.twiml.VoiceResponse;
import com.twilio.twiml.voice.Say;
import com.twilio.twiml.TwiMLException;


public class Example {
    public static void main(String[] args) {
        Say say = new Say.Builder("We're sorry. All of our agents are busy right now.").build();
        Say say2 = new Say.Builder("Please stay on the line to be redirected to the main menu.").build();
        Parameter parameter = new Parameter.Builder().name("payment_collected").value("false").build();
        Hangup hangup = new Hangup.Builder().parameter(parameter).build();
        Say say3 = new Say.Builder("We will call you back as soon as possible.").build();
        VoiceResponse response = new VoiceResponse.Builder().say(say).say(say3).say(say2).hangup(hangup).build();

        try {
            System.out.println(response.toXml());
        } catch (TwiMLException e) {
            e.printStackTrace();
        }
    }
}
