import com.twilio.sdk.verbs.Gather;
import com.twilio.sdk.verbs.Say;
import com.twilio.sdk.verbs.TwiMLException;
import com.twilio.sdk.verbs.TwiMLResponse;

public class Example {
    public static void main(String[] args) {
        TwiMLResponse twiml = new TwiMLResponse();
        try {
            Say say = new Say("Welcome to Twilio, please tell us why you're calling");
            Gather gather = new Gather();
            gather.setAction("/completed");
            gather.set("input", "speech");
            gather.append(say);

            twiml.append(gather);
        } catch (TwiMLException e) {
            e.printStackTrace();
        }

        System.out.println(twiml.toXML());
    }
}
