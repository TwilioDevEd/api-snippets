// Install the Java helper library from twilio.com/docs/java/install
import java.io.IOException;

import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.twilio.twiml.voice.Dial;
import com.twilio.twiml.voice.Queue;
import com.twilio.twiml.TwiMLException;
import com.twilio.twiml.VoiceResponse;

public class Example extends HttpServlet {
  public void service(final HttpServletRequest request, final HttpServletResponse response)
      throws IOException {
    Dial dial = new Dial.Builder()
        .queue(new Queue.Builder("Queue Demo").build())
        .build();

    VoiceResponse voiceResponse = new VoiceResponse.Builder()
        .dial(dial)
        .build();

    try {
      response.getWriter().print(voiceResponse.toXml());
    } catch (TwiMLException e) {
      e.printStackTrace();
    }
  }
}
