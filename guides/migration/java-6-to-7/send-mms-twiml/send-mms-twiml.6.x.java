import com.twilio.sdk.verbs.Body;
import com.twilio.sdk.verbs.Media;
import com.twilio.sdk.verbs.Message;
import com.twilio.sdk.verbs.TwiMLException;
import com.twilio.sdk.verbs.TwiMLResponse;

public class Example {
    public static void main(String[] args) {
        // Create a TwiML builder object
        TwiMLResponse twiml = new TwiMLResponse();
        try {
            Message message = new Message();
            Body body = new Body("Hello friend");
            Media media = new Media("https://demo.twilio.com/owl.png");
            message.append(body);
            message.append(media);

            twiml.append(message);
        } catch (TwiMLException e) {
            e.printStackTrace();
        }

        System.out.println(twiml.toXML());
    }
}
