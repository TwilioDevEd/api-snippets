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

    final com.twilio.sdk.verbs.Task task = new com.twilio.sdk.verbs.Task("{\"account_number\":\"12345abcdef\"}");

    try {
        enqueue.append(task);
        twiml.append(enqueue);
    } catch (final TwiMLException e) {
        // TODO Auto-generated catch block
        e.printStackTrace();
    }

    return twiml.toXML();
  }
}