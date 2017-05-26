import com.twilio.twiml.Media;
import com.twilio.twiml.Message;
import com.twilio.twiml.MessagingResponse;
import com.twilio.twiml.TwiMLException;
import com.twilio.twiml.Method;


public class Message4 {
    public static void main(String[] args) {
        Media media = new Media("https://demo.twilio.com/owl.png");
        Message message = new Message.Builder("Hello Jenny").media(media)
            .build();
        MessagingResponse response = new MessagingResponse.Builder()
            .message(message).build();

        try {
            System.out.println(response.toXml());
        } catch (TwiMLException e) {
            e.printStackTrace();
        }
    }
}
