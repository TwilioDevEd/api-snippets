import com.twilio.twiml.Redirect;
import com.twilio.twiml.VoiceResponse;
import com.twilio.twiml.TwiMLException;
import com.twilio.twiml.Method;


public class Example {
    public static void main(String[] args) {
        Redirect redirect = new Redirect.Builder()
            .url("http://www.foo.com/nextInstructions").build();
        VoiceResponse response = new VoiceResponse.Builder().redirect(redirect)
            .build();

        try {
            System.out.println(response.toXml());
        } catch (TwiMLException e) {
            e.printStackTrace();
        }
    }
}
