import com.twilio.twiml.messaging.Body;
import com.twilio.twiml.messaging.Message;
import com.twilio.twiml.voice.Redirect;
import com.twilio.twiml.MessagingResponse;
import com.twilio.twiml.TwiMLException;


public class Example {
    public static void main(String[] args) {
        Body body = new Body("Hello World!");
        Message message = new Message.Builder().body(body).build();
        Redirect redirect = new Redirect.Builder()
            .url("https://demo.twilio.com/sms/welcome").build();
        MessagingResponse response = new MessagingResponse.Builder()
            .message(message).redirect(redirect).build();

        try {
            System.out.println(response.toXml());
        } catch (TwiMLException e) {
            e.printStackTrace();
        }
    }
}
