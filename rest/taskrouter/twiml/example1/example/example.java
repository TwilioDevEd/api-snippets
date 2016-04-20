// Install the Java helper library from twilio.com/docs/java/install
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.twilio.sdk.verbs.Enqueue;
import com.twilio.sdk.verbs.TwiMLException;
import com.twilio.sdk.verbs.TwiMLResponse;

public class Example extends HttpServlet {

  @Override
  public void service(final HttpServletRequest request, final HttpServletResponse response) throws IOException {
    final TwiMLResponse twiml = new TwiMLResponse();
    final Enqueue enqueue = new Enqueue();
    enqueue.setWorkflowSid("WW0123456789abcdef0123456789abcdef");

    try {
      twiml.append(enqueue);
    } catch (final TwiMLException e) {
        e.printStackTrace();
    }

    return twiml.toXML();
  }
}