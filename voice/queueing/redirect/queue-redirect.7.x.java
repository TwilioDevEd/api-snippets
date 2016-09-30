// Install the Java helper library from twilio.com/docs/java/install
import java.io.IOException;

import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.twilio.twiml.*;

public class Example extends HttpServlet {
  public void service(HttpServletRequest request, HttpServletResponse response) throws IOException {
    Say say =
        new Say.Builder("You will now be connected to the first caller in the queue.").build();

    Queue queueInDial = new Queue.Builder("Queue Demo").build();

    Dial dial = new Dial.Builder()
        .queue(queueInDial)
        .build();

    Redirect redirect = new Redirect.Builder().build();

    VoiceResponse twiml = new VoiceResponse.Builder()
        .say(say)
        .dial(dial)
        .redirect(redirect)
        .build();

    response.setContentType("application/xml");

    try {
      response.getWriter().print(twiml.toXml());
    } catch (TwiMLException e) {
      e.printStackTrace();
    }
  }
}
