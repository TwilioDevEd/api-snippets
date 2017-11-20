// Install the Java helper library from twilio.com/docs/java/install
import java.io.IOException;

import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.twilio.twiml.voice.Enqueue;
import com.twilio.twiml.TwiMLException;
import com.twilio.twiml.VoiceResponse;

public class Example extends HttpServlet {
  public void service(HttpServletRequest request, HttpServletResponse response) throws IOException {
    Enqueue enqueue = new Enqueue.Builder().queueName("Queue Demo").build();
    VoiceResponse twiml = new VoiceResponse.Builder().enqueue(enqueue).build();

    response.setContentType("application/xml");

    try {
      response.getWriter().print(twiml.toXml());
    } catch (TwiMLException e) {
      e.printStackTrace();
    }
  }
}
