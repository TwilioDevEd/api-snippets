import com.twilio.twiml.Message;
import com.twilio.twiml.Redirect;
import com.twilio.twiml.MessagingResponse;
import com.twilio.twiml.TwiMLException;
import com.twilio.twiml.Method;


public class YourResponse1 {
    public static void main(String[] args) {
        Message message = new Message.Builder("Hello World!").build();
        Redirect redirect = new Redirect.Builder().url("https://demo.twilio.com/sms/welcome").build();
        MessagingResponse response = new MessagingResponse.Builder().message(message).redirect(redirect).build();

        try {
            System.out.println(response.toXml());
        } catch (TwiMLException e) {
            e.printStackTrace();
        }
    }
}