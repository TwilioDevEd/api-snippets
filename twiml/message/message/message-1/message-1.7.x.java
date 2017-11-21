import com.twilio.twiml.messaging.Message;
import com.twilio.twiml.MessagingResponse;
import com.twilio.twiml.TwiMLException;


public class Example {
    public static void main(String[] args) {
        Message message = new Message.Builder("Store Location: 123 Easy St.")
            .build();
        MessagingResponse response = new MessagingResponse.Builder()
            .message(message).build();

        try {
            System.out.println(response.toXml());
        } catch (TwiMLException e) {
            e.printStackTrace();
        }
    }
}
