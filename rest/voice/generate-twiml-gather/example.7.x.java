import java.io.IOException;

import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.twilio.twiml.*;

public class TwilioServlet extends HttpServlet {
  public void service(HttpServletRequest request, HttpServletResponse response) throws IOException {
    // Use the caller's name
    String message = "Hello. It's me.";

    // Create a TwiML response and add our friendly message.
    Say say = new Say.Builder(message).build();

    // Play an MP3 for incoming callers.
    Play play = new Play.Builder("http://howtodocs.s3.amazonaws.com/ahoyhoy.mp3").build();

    Say sayInGather = new Say.Builder("To speak to a real person, press 1. "
        + "Press 2 to record a message for a Twilio educator. "
        + "Press any other key to start over.").build();

    Gather gather = new Gather.Builder()
        .action("/handle-gather")
        .numDigits(1)
        .method(HttpMethod.POST)
        .say(sayInGather)
        .build();

    VoiceResponse twiml = new VoiceResponse.Builder()
        .say(say)
        .play(play)
        .gather(gather)
        .build();

    response.setContentType("application/xml");
    try {
      response.getWriter().print(twiml.toXml());
    } catch (TwiMLException e) {
      e.printStackTrace();
    }
  }
}
