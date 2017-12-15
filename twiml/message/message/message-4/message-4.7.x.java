import com.twilio.twiml.Body;
import com.twilio.twiml.Media;
import com.twilio.twiml.Message;
import com.twilio.twiml.MessagingResponse;
import com.twilio.twiml.TwiMLException;


public class Example {
    public static void main(String[] args) {
        Body body = new Body("Hello friend");
        Media media = new Media("https://demo.twilio.com/owl.png");
        Message message = new Message.Builder().body(body).media(media).build();
        MessagingResponse response = new MessagingResponse.Builder()
            .message(message).build();

        try {
            System.out.println(response.toXml());
        } catch (TwiMLException e) {
            e.printStackTrace();
        }
    }
}
