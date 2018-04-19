import java.io.IOException;

import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.twilio.twiml.*;
import com.twilio.twiml.voice.Number;


public class TwilioServlet extends HttpServlet {
  public void service(HttpServletRequest request, HttpServletResponse response) throws IOException {
    String message;
    // Use the caller's name
    message = "Hello. It's me.";

    // Create a TwiML response and add our friendly message.
    Say say = new Say.Builder(message).build();

    // Play an MP3 for incoming callers.
    Play play = new Play.Builder("http://howtodocs.s3.amazonaws.com/ahoyhoy.mp3").build();

    Say sayInGather = new Say.Builder("To speak to a real person, press 1. "
        + "Press 2 to record a message for a Twilio educator. "
        + "Press any other key to start over.").build();

    Gather gather = new Gather.Builder().action("/handle-gather").numDigits(1).method(HttpMethod.POST)
        .say(sayInGather).build();

    VoiceResponse twiml = new VoiceResponse.Builder().say(say).play(play).gather(gather).build();
    response.setContentType("application/xml");
    try {
      response.getWriter().print(twiml.toXml());
    } catch (TwiMLException e) {
      e.printStackTrace();
    }
  }
}


public class TwilioHandleKeyServlet extends HttpServlet {
  public void service(HttpServletRequest request, HttpServletResponse response) throws IOException {
    String digits = request.getParameter("Digits");
    VoiceResponse twiml;

    if (digits != null && digits.equals("1")) {
      // Connect 310 555 1212 to the incoming caller.
      Number number = new Number.Builder("+13105551212").build();
      Dial dial = new Dial.Builder().number(number).build()

      // If the above dial failed, say an error message.
      Say say = new Say.Builder("The call failed, or the remote party hung up. Goodbye.").build();

      twiml = new VoiceResponse.Builder().dial(dial).say(say).build();
    } else if (digits != null && digits.equals("2")) {
      Say pleaseLeaveMessage = new Say.Builder("Record your message after the tone.").build();
      // Record the caller's voice.
      Record record = new Record.Builder().maxLength(30).action("/handle-recording").build();

      twiml = new VoiceResponse.Builder().say(pleaseLeaveMessage).record(record).build();
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
