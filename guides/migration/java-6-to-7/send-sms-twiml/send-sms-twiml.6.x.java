import com.twilio.sdk.verbs.Body;
import com.twilio.sdk.verbs.Message;
import com.twilio.sdk.verbs.TwiMLException;
import com.twilio.sdk.verbs.TwiMLResponse;

public class Example {
    public static void main(String[] args) {
        // Create a TwiML builder object
        TwiMLResponse twiml = new TwiMLResponse();
        try {
            Message message = new Message();
            Body body = new Body("Store Location: 123 Easy St.");
            message.append(body);

            twiml.append(message);
        } catch (TwiMLException e) {
            e.printStackTrace();
        }

        System.out.println(twiml.toXML());
    }
}
