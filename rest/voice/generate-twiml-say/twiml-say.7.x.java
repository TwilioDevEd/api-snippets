import java.io.IOException;

import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.twilio.twiml.Say;
import com.twilio.twiml.TwiMLException;
import com.twilio.twiml.VoiceResponse;

public class TwilioServlet extends HttpServlet {
  // service() responds to both GET and POST requests.
  // You can also use doGet() or doPost()
  public void service(HttpServletRequest request, HttpServletResponse response) throws IOException {
    Say message =
        new Say.Builder(
          "Hello. It's me. I've been wondering if after this guide you'd like to meet.").build();
    VoiceResponse twiml = new VoiceResponse.Builder().say(message).build();

    response.setContentType("application/xml");
    try {
      response.getWriter().print(twiml.toXml());
    } catch (TwiMLException e) {
      e.printStackTrace();
    }
  }
}
