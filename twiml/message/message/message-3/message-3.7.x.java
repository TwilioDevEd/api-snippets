import com.twilio.twiml.Message;
import com.twilio.twiml.MessagingResponse;
import com.twilio.twiml.TwiMLException;
import com.twilio.twiml.Method;


public class Message-3.7.x {
    public static void main(String[] args) {
        Message message = new Message.Builder("Store Location: 123 Easy St.").action("/SmsHandler.php").method(Method.POST).build();
        MessagingResponse response = new MessagingResponse.Builder().message(message).build();
        try {
            System.out.println(response.toXml());
        } catch (TwiMLException e) {
            e.printStackTrace();
        }
    }
}