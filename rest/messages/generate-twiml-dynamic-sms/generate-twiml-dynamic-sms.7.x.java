import java.io.IOException;

import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.twilio.twiml.messaging.Body;
import com.twilio.twiml.messaging.Message;
import com.twilio.twiml.MessagingResponse;
import com.twilio.twiml.TwiMLException;

public class TwilioServlet extends HttpServlet {
  public void service(HttpServletRequest request, HttpServletResponse response) throws IOException {
    String body = request.getParameter("Body");
    String message;
    if (body == "hello") {
      // Use a generic message
      message = "Hi there!";
    } else if (body == "bye") {
      // Use the caller's name
      message = "Goodbye!";
    }

    // Create a TwiML response and add our friendly message.
    Message sms = new Message.Builder().body(new Body(message)).build();
    MessagingResponse twiml = new MessagingResponse.Builder().message(sms).build();

    response.setContentType("application/xml");

    try {
      response.getWriter().print(twiml.toXml());
    } catch (TwiMLException e) {
      e.printStackTrace();
    }
  }
}
