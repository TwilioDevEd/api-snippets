import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.twilio.twiml.voice.Conference;
import com.twilio.twiml.voice.Dial;
import com.twilio.twiml.TwiMLException;
import com.twilio.twiml.VoiceResponse;


@SuppressWarnings("serial")
@WebServlet("/voice")
public class IncomingCallServlet extends HttpServlet {

  // Update with your own phone number in E.164 format
  public static final String MODERATOR = "+15558675309";

  // Handle HTTP POST to /voice
  protected void doPost(HttpServletRequest request, HttpServletResponse response)
      throws ServletException, IOException {
    // Get the number of the incoming caller
    String fromNumber = request.getParameter("From");

    Conference.Builder conferenceBuilder = new Conference.Builder("My Conference");

    if (MODERATOR.equalsIgnoreCase(fromNumber)) {
      conferenceBuilder.startConferenceOnEnter(true);
      conferenceBuilder.endConferenceOnExit(true);
    } else {
      conferenceBuilder.endConferenceOnExit(false);
    }

    // Create a TwiML builder object
    VoiceResponse twiml = new VoiceResponse.Builder()
        .dial(new Dial.Builder()
              .conference(conferenceBuilder.build())
              .build()
        ).build();

    // Render TwiML as XML
    response.setContentType("text/xml");

    try {
      response.getWriter().print(twiml.toXml());
    } catch (TwiMLException e) {
      e.printStackTrace();
    }



  }
}
