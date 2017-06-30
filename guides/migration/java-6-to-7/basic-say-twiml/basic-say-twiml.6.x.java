import com.twilio.sdk.verbs.Say;
import com.twilio.sdk.verbs.TwiMLException;
import com.twilio.sdk.verbs.TwiMLResponse;

public class Example {
    public static void main(String[] args) {
        TwiMLResponse twiml = new TwiMLResponse();
        try {
            Say message = new Say("Hello World!");
            message.setVoice("alice");
            message.setLanguage("en-GB");
            twiml.append(message);
        } catch (TwiMLException e) {
            e.printStackTrace();
        }

        System.out.println(twiml.toXML());
    }
}
