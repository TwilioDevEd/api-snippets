// Install the Java helper library from twilio.com/docs/libraries/java
import java.util.*;
import java.io.IOException;

import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.twilio.twiml.messaging.Body;
import com.twilio.twiml.messaging.Media;
import com.twilio.twiml.messaging.Message;
import com.twilio.twiml.MessagingResponse;
import com.twilio.twiml.TwiMLException;

public class ReplyByName extends HttpServlet {
    // service() responds to both GET and POST requests.
    // You can also use doGet() or doPost()
    public void service(HttpServletRequest request, HttpServletResponse response) throws IOException {
        // Create a dict of people we know.
        HashMap<String, String> people = new HashMap<String, String>();
        people.put("+14158675309", "Curious George");
        people.put("+14158675310", "Boots");
        people.put("+14158675311", "Virgil");

        // if the sender is known, then greet them by name
        String fromNumber = request.getParameter("From");
        String name = fromNumber != null && people.get(fromNumber) != null
            ? people.get(fromNumber)
            : "Monkey";
        String message =String.format("%s, thanks for the message!", name);

        try {
            MessagingResponse twiml = new MessagingResponse
                .Builder()
                .message(message)
                .build();
        } catch (TwiMLException e) {
            e.printStackTrace();
        }

        response.setContentType("application/xml");
        response.getWriter().print(twiml.toXml());
    }
}
