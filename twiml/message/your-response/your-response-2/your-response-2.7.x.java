import com.twilio.twiml.messaging.Message;
import com.twilio.twiml.MessagingResponse;
import com.twilio.twiml.TwiMLException;


public class Example {
    public static void main(String[] args) {
        Message message = new Message.Builder("This is message 1 of 2.")
            .build();
        Message message2 = new Message.Builder("This is message 2 of 2.")
            .build();
        MessagingResponse response = new MessagingResponse.Builder()
            .message(message).message(message2).build();

        try {
            System.out.println(response.toXml());
        } catch (TwiMLException e) {
            e.printStackTrace();
        }
    }
}
