// Install the Java helper library from twilio.com/docs/libraries/java
import java.util.*;
import java.io.IOException;

import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.twilio.twiml.voice.Say;
import com.twilio.twiml.voice.Sms;
import com.twilio.twiml.TwiMLException;
import com.twilio.twiml.VoiceResponse;

public class SendSmsDuringCall extends HttpServlet {
    // service() responds to both GET and POST requests.
    // You can also use doGet() or doPost()
    public void service(HttpServletRequest request, HttpServletResponse response) throws IOException {
        // Create a dict of people we know.
        HashMap<String, String> people = new HashMap<String, String>();
        people.put("+14158675309", "Curious George");
        people.put("+14158675310", "Boots");
        people.put("+14158675311", "Virgil");

        // if the sender is known, then greet them by name
        String name = people.get(Request.getParameter("From")) != null
            ? people.get(Request.getParameter("From"))
            : "Monkey";

        try {
            Say say = new Say.Builder()
                .build(String.format("Hello! %s", name));
            Sms sms = new Sms.Builder()
                .build(String.format("%s, thanks for the call!", name));
            VoiceResponse twiml = new VoiceResponse.Builder()
                .say(say)
                .sms(sms)
                .build();
        } catch (TwiMLException e) {
            e.printStackTrace();
        }

        response.setContentType("application/xml");
        response.getWriter().print(twiml.toXml());
    }
}
