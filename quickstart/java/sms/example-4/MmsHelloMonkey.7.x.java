// Install the Java helper library from twilio.com/docs/libraries/java
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

import com.twilio.twiml.messaging.Body;
import com.twilio.twiml.messaging.Media;
import com.twilio.twiml.messaging.Message;
import com.twilio.twiml.MessagingResponse;
import com.twilio.twiml.TwiMLException;

public class MmsHelloMonkey extends HttpServlet {
    // service() responds to both GET and POST requests.
    // You can also use doGet() or doPost()
    public void service(HttpServletRequest request, HttpServletResponse response) throws IOException {
        try {
            Message sms = new Message.Builder()
                .body(new Body("Hello, Mobile Monkey"))
                .media(new Media("https://demo.twilio.com/owl.png"))
                .build();
            MessagingResponse twiml = new MessagingResponse
                .Builder()
                .message(sms)
                .build();
        } catch (TwiMLException e) {
            e.printStackTrace();
        }

        response.setContentType("application/xml");
        response.getWriter().print(twiml.toXml());
    }
}
