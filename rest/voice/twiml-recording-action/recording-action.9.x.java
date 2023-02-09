import java.io.IOException;

import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.twilio.twiml.voice.Play;
import com.twilio.twiml.voice.Say;
import com.twilio.twiml.TwiMLException;
import com.twilio.twiml.VoiceResponse;


public class TwilioHandleRecordingServlet extends HttpServlet {
  public void service(HttpServletRequest request, HttpServletResponse response) throws IOException {
    String recordingUrl = request.getParameter("RecordingUrl");

    Say sayHello = new Say.Builder("Listen to your recorded message.").build();
    Say sayGoodbye = new Say.Builder("Goodbye").build();

    VoiceResponse twiml;

    if (recordingUrl != null) {
      Play play = new Play.Builder(recordingUrl).build();

      twiml = new VoiceResponse.Builder().say(sayHello).play(play).say(sayGoodbye).build();
    } else {
      response.sendRedirect("/twiml");
      return;
    }

    response.setContentType("application/xml");
    try {
      response.getWriter().print(twiml.toXml());
    } catch (TwiMLException e) {
      e.printStackTrace();
    }
  }
}
