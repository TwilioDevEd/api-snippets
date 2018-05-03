import com.twilio.http.HttpMethod;
import com.twilio.twiml.messaging.Body;
import com.twilio.twiml.messaging.Message;
import com.twilio.twiml.MessagingResponse;
import com.twilio.twiml.TwiMLException;

public class Example {
    public static void main(String[] args) {
        Body body = new Body.Builder("Store Location: 123 Easy St.").build();
        Message message = new Message.Builder().action("/SmsHandler.php")
            .method(HttpMethod.POST).body(body).build();
        MessagingResponse response = new MessagingResponse.Builder()
            .message(message).build();

        try {
            System.out.println(response.toXml());
        } catch (TwiMLException e) {
            e.printStackTrace();
        }
    }
}
