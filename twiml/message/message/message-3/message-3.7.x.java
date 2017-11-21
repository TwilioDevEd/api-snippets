import com.twilio.twiml.messaging.Message;
import com.twilio.twiml.MessagingResponse;
import com.twilio.twiml.TwiMLException;
import com.twilio.http.HttpMethod;

public class Example {
    public static void main(String[] args) {
        Message message = new Message.Builder("Store Location: 123 Easy St.")
            .action("/SmsHandler.php").method(HttpMethod.POST).build();
        MessagingResponse response = new MessagingResponse.Builder()
            .message(message).build();

        try {
            System.out.println(response.toXml());
        } catch (TwiMLException e) {
            e.printStackTrace();
        }
    }
}
