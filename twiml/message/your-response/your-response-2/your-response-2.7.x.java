import com.twilio.twiml.Message;
import com.twilio.twiml.MessagingResponse;
import com.twilio.twiml.TwiMLException;
import com.twilio.twiml.Method;


public class Your-response-2.7.x {
    public static void main(String[] args) {
        Message message = new Message.Builder("This is message 1 of 2.").build();
        Message message = new Message.Builder("This is message 2 of 2.").build();
        MessagingResponse response = new MessagingResponse.Builder().message(message).message(message).build();
        try {
            System.out.println(response.toXml());
        } catch (TwiMLException e) {
            e.printStackTrace();
        }
    }
}