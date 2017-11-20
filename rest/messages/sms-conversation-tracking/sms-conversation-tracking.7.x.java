import java.io.IOException;
import java.util.HashMap;

import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.twilio.twiml.messaging.Body;
import com.twilio.twiml.messaging.Message;
import com.twilio.twiml.MessagingResponse;
import com.twilio.twiml.TwiMLException;

public class TwilioServlet extends HttpServlet {
  public void service(HttpServletRequest request, HttpServletResponse response) throws IOException {
    HttpSession session = request.getSession(true);
    Integer counter = (Integer) session.getAttribute("counter");
    if (counter == null) {
      counter = new Integer(0);
    }

    /* Increment the counter by one, and store the count in the session. */
    int count = counter.intValue();
    count++;
    session.setAttribute("counter", new Integer(count));

    // Create a dict of people we know.
    HashMap<String, String> callers = new HashMap<String, String>();
    callers.put("+14158675309", "Rey");
    callers.put("+14158675310", "Finn");
    callers.put("+14158675311", "Chewy");

    String fromNumber = request.getParameter("From");
    String toNumber = request.getParameter("To");
    String fromName = callers.get(fromNumber);
    if (fromName == null) {
      // Use the caller's name
      fromName = "Friend";
    }

    String message =
        fromName + " has messaged " + toNumber + " " + String.valueOf(count) + " times.";

    // Create a TwiML response and add our friendly message.
    Message sms = new Message.Builder().body(new Body(message)).build();
    MessagingResponse twimlResponse = new MessagingResponse.Builder().message(sms).build();

    response.setContentType("application/xml");

    try {
      response.getWriter().print(twimlResponse.toXml());
    } catch (TwiMLException e) {
      e.printStackTrace();
    }
  }
}
