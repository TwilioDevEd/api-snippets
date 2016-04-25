// Install the Java helper library from twilio.com/docs/java/install
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.twilio.sdk.verbs.Dial;
import com.twilio.sdk.verbs.Queue;
import com.twilio.sdk.verbs.Redirect;
import com.twilio.sdk.verbs.Say;
import com.twilio.sdk.verbs.TwiMLException;
import com.twilio.sdk.verbs.TwiMLResponse;

public class Example extends HttpServlet {

  @Override
  public void service(final HttpServletRequest request, final HttpServletResponse response) throws IOException {
    TwiMLResponse twiml = new TwiMLResponse();
    Say say = new Say("You will now be connected to the first caller in the queue.");
    Dial dial = new Dial();
    Queue queueInDial = new Queue("Queue Demo");
    Redirect redirect = new Redirect();

    try {
      twiml.append(say);
      twiml.append(dial);
      dial.append(queueInDial);
      twiml.append(redirect);
    } catch (final TwiMLException e) {
        e.printStackTrace();
    }

    return twiml.toXML();
  }
}