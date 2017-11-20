// Install the Java helper library from twilio.com/docs/libraries/java
import java.io.IOException;
import java.util.*;

import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.twilio.twiml.messaging.Body;
import com.twilio.twiml.messaging.Message;
import com.twilio.twiml.MessagingResponse;
import com.twilio.twiml.TwiMLException;

public class TrackingSmsConversations extends HttpServlet {

    public void service(HttpServletRequest request, HttpServletResponse response) throws IOException {
        HttpSession session = request.getSession(true);
        Integer sessionCounter = (Integer)session.getAttribute("counter");
        Integer counter = sessionCounter != null ? sessionCounter : new Integer(0);

        /* Increment the counter by one, and store the count in the session. */
        int count = counter.intValue();
        count++;
        session.setAttribute("counter", new Integer(count));

        // Create a dict of people we know.
        HashMap<String, String> people = new HashMap<String, String>();
        people.put("+14158675309", "Curious George");
        people.put("+14158675310", "Boots");
        people.put("+14158675311", "Virgil");

        String toNumber = request.getParameter("To");
        String fromNumber = request.getParameter("From");
        String name = fromNumber != null && people.get(fromNumber) != null
            ? people.get(fromNumber)
            : "Monkey";
        String message = String.format(
            "%s has messaged %s %d times.",
            name, toNumber, String.valueOf(count));

        try {
            // Create a TwiML response and add our friendly message.
            Message sms = new Message
                .Builder()
                .body(new Body(message))
                .build();
            MessagingResponse twimlResponse = new MessagingResponse
                .Builder()
                .message(sms)
                .build();
        } catch (TwiMLException e) {
            e.printStackTrace();
        }

        response.setContentType("application/xml");
        response.getWriter().print(twimlResponse.toXml());
    }
}
