// Install the Java helper library from twilio.com/docs/java/install
import java.io.IOException;

import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.twilio.twiml.Dial;
import com.twilio.twiml.Queue;
import com.twilio.twiml.TwiMLException;
import com.twilio.twiml.VoiceResponse;

public class Example extends HttpServlet {

  @Override
  public void service(HttpServletRequest request, HttpServletResponse response) throws IOException {
    Queue queue = new Queue.Builder("Queue Demo").build();
    Dial dial = new Dial.Builder().queue(queue).build();

    VoiceResponse twiml = new VoiceResponse.Builder().dial(dial).build();

    response.setContentType("application/xml");

    try {
      response.getWriter().print(twiml.toXml());
    } catch (TwiMLException e) {
      e.printStackTrace();
    }
  }
}
