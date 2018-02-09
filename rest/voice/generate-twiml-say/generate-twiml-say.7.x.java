import java.io.IOException;

import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.twilio.twiml.voice.Say;
import com.twilio.twiml.TwiMLException;
import com.twilio.twiml.VoiceResponse;

public class TwilioServlet extends HttpServlet {
  // service() responds to both GET and POST requests.
  // You can also use doGet() or doPost()
  public void service(HttpServletRequest request, HttpServletResponse response) throws IOException {
    Say message =
        new Say.Builder(
          "Hello from your pals at Twilio! Have fun.").build();
    VoiceResponse twiml = new VoiceResponse.Builder().say(message).build();

    response.setContentType("application/xml");
    try {
      response.getWriter().print(twiml.toXml());
    } catch (TwiMLException e) {
      e.printStackTrace();
    }
  }
}
