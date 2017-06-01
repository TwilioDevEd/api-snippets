import com.twilio.twiml.Body;
import com.twilio.twiml.Message;
import com.twilio.twiml.Redirect;
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
