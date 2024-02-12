import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.twilio.twiml.voice.Say;
import com.twilio.twiml.TwiMLException;
import com.twilio.twiml.VoiceResponse;

@SuppressWarnings("serial")
@WebServlet("/voice")
public class IncomingCallServlet extends HttpServlet {
  // Handle HTTP POST to /voice
  protected void doPost(HttpServletRequest request, HttpServletResponse response)
    throws ServletException, IOException {
      
    Say say = new Say.Builder("Hello world!").build();
    VoiceResponse twiml = new VoiceResponse.Builder().say(say).build();

    // Render TwiML as XML
    response.setContentType("text/xml");

    try {
      response.getWriter().print(twiml.toXml());
    } catch (TwiMLException e) {
      e.printStackTrace();
    }

  }
}
