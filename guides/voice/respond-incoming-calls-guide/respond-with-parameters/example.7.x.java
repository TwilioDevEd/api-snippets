import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.twilio.twiml.voice.Play;
import com.twilio.twiml.voice.Say;
import com.twilio.twiml.TwiMLException;
import com.twilio.twiml.VoiceResponse;

@SuppressWarnings("serial")
@WebServlet("/voice")
public class IncomingCallServlet extends HttpServlet {
  // Handle HTTP POST to /voice
  protected void doPost(HttpServletRequest request, HttpServletResponse response)
      throws ServletException, IOException {
    // Get the city from the incoming call (if available)
    String fromCity = request.getParameter("FromCity");
    if (fromCity == null) {
      fromCity = "home slice";
    }

    // Create a TwiML builder object
    VoiceResponse twiml = new VoiceResponse.Builder()
        .say(new Say.Builder(String.format("Never gonna give you up, %s!", fromCity)).build())
        .play(new Play.Builder("https://demo.twilio.com/docs/classic.mp3").build())
        .build();

    // Render TwiML as XML
    response.setContentType("text/xml");

    try {
      response.getWriter().print(twiml.toXml());
    } catch (TwiMLException e) {
      e.printStackTrace();
    }



  }

}
