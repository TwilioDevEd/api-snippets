import com.twilio.twiml.messaging.Body;
import com.twilio.twiml.messaging.Message;
import com.twilio.twiml.messaging.Redirect;
import com.twilio.twiml.MessagingResponse;
import com.twilio.twiml.TwiMLException;


public class Example {
    public static void main(String[] args) {
        Body body = new Body.Builder("Hello World!").build();
        Message message = new Message.Builder().body(body).build();
        Redirect redirect = new Redirect
            .Builder("https://demo.twilio.com/welcome/sms/").build();
        MessagingResponse response = new MessagingResponse.Builder()
            .message(message).redirect(redirect).build();

        try {
            System.out.println(response.toXml());
        } catch (TwiMLException e) {
            e.printStackTrace();
        }
    }
}
