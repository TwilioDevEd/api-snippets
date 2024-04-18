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
    String message = "Message";
    if (body.equals("hello")) {
      // Say hi
      message = "Hi there!";
    } else if (body.equals("bye")) {
      // Say goodbye
      message = "Goodbye!";
    }

    // Create a TwiML response and add our friendly message.
    Body messageBody = new Body.Builder(message).build();
    Message sms = new Message.Builder().body(messageBody).build();
    MessagingResponse twiml = new MessagingResponse.Builder().message(sms).build();

    response.setContentType("application/xml");

    try {
      response.getWriter().print(twiml.toXml());
    } catch (TwiMLException e) {
      e.printStackTrace();
    }
  }
}
