// Install the Java helper library from twilio.com/docs/libraries/java
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

import com.twilio.sdk.verbs.TwiMLResponse;
import com.twilio.sdk.verbs.TwiMLException;
import com.twilio.sdk.verbs.Message;
import com.twilio.sdk.verbs.Body;
import com.twilio.sdk.verbs.Media;

public class MmsHelloMonkey extends HttpServlet {
    // service() responds to both GET and POST requests.
    // You can also use doGet() or doPost()
    public void service(HttpServletRequest request, HttpServletResponse response) throws IOException {
        TwiMLResponse twiml = new TwiMLResponse();
        Message message = new Message();

        try {
            message.append(new Body("Hello, Mobile Monkey"));
            message.append(new Media("https://demo.twilio.com/owl.png"));
            twiml.append(message);
        } catch (TwiMLException e) {
            e.printStackTrace();
        }

        response.setContentType("text/xml");
        response.getWriter().print(twiml.toXML());
    }
}
