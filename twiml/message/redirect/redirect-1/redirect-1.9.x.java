import com.twilio.twiml.messaging.Redirect;
import com.twilio.twiml.MessagingResponse;
import com.twilio.twiml.TwiMLException;


public class Example {
    public static void main(String[] args) {
        Redirect redirect = new Redirect.Builder("http://www.example.com/nextInstructions").build();
        MessagingResponse response = new MessagingResponse.Builder().redirect(redirect).build();

        try {
            System.out.println(response.toXml());
        } catch (TwiMLException e) {
            e.printStackTrace();
        }
    }
}
