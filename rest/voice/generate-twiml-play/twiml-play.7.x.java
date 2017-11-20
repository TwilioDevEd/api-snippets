import java.io.IOException;

import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.twilio.twiml.voice.Play;
import com.twilio.twiml.voice.Say;
import com.twilio.twiml.TwiMLException;
import com.twilio.twiml.VoiceResponse;

public class TwilioServlet extends HttpServlet {
  public void service(HttpServletRequest request, HttpServletResponse response) throws IOException {
    // Create a TwiML response and add our friendly message.
    Say say = new Say.Builder("Hello. It's me.").build();
    Play play = new Play.Builder("http://howtodocs.s3.amazonaws.com/ahoyhoy.mp3").build();

    VoiceResponse twiml = new VoiceResponse.Builder().say(say).play(play).build();

    response.setContentType("application/xml");
    try {
      response.getWriter().print(twiml.toXml());
    } catch (TwiMLException e) {
      e.printStackTrace();
    }
  }
}
