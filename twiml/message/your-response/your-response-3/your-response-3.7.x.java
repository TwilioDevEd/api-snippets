import com.twilio.twiml.Message;
import com.twilio.twiml.MessagingResponse;
import com.twilio.twiml.TwiMLException;
import com.twilio.twiml.Method;


public class Your-response-3.7.x {
    public static void main(String[] args) {
        Message message = new Message.Builder("I'm hungry!").build();
        MessagingResponse response = new MessagingResponse.Builder().message(message).build();
        try {
            System.out.println(response.toXml());
        } catch (TwiMLException e) {
            e.printStackTrace();
        }
    }
}