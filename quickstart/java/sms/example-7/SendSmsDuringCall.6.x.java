// Install the Java helper library from twilio.com/docs/libraries/java
import java.util.*;
import java.io.IOException;

import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.twilio.sdk.verbs.TwiMLResponse;
import com.twilio.sdk.verbs.TwiMLException;
import com.twilio.sdk.verbs.Say;
import com.twilio.sdk.verbs.Sms;

public class SendSmsDuringCall extends HttpServlet {
    // service() responds to both GET and POST requests.
    // You can also use doGet() or doPost()
    public void service(HttpServletRequest request, HttpServletResponse response) throws IOException {
        // Create a dict of people we know.
        HashMap<String, String> people = new HashMap<String, String>();
        people.put("+14158675308", "Curious George");
        people.put("+12349013030", "Boots");
        people.put("+12348134522", "Virgil");

        // if the sender is known, then greet them by name
        String fromNumber = request.getParameter("From");
        String name = fromNumber != null && people.get(fromNumber) != null
            ? people.get(fromNumber)
            : "Monkey";

        TwiMLResponse twiml = new TwiMLResponse();
        try {
            twiml.append(new Say(String.format("Hello! %s", name)));
            twiml.append(new Sms(String.format("%s, thanks for the call!", name)));
        } catch (TwiMLException e) {
            e.printStackTrace();
        }

        response.setContentType("application/xml");
        response.getWriter().print(twiml.toXML());
    }
}
