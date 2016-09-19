import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.twilio.twiml.*;

@SuppressWarnings("serial")
@WebServlet("/voice")
public class RecordServlet extends HttpServlet {

  // Handle HTTP POST to /record
  protected void doPost(HttpServletRequest request, HttpServletResponse response)
      throws ServletException, IOException {
    // Use <Say> to give the caller some instructions
    Say instructions = new Say.Builder("Hello. Please leave a message after the beep.").build();

    // Use <Record> to record the caller's message
    Record record = new Record.Builder().build();

    // End the call with <Hangup>
    Hangup hangup = new Hangup();

    // Create a TwiML builder object
    VoiceResponse twiml = new VoiceResponse.Builder()
        .say(instructions)
        .record(record)
        .hangup(hangup)
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
