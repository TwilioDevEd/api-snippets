// Install the Java helper library from twilio.com/docs/java/install
import java.io.IOException;

import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.twilio.twiml.voice.EnqueueTask;
import com.twilio.twiml.Task;
import com.twilio.twiml.TwiMLException;
import com.twilio.twiml.VoiceResponse;


public class Example extends HttpServlet {

  @Override
  public void service(HttpServletRequest request, HttpServletResponse response) throws IOException {
    Task task = new Task.Builder()
        .data("{\"account_number\":\"12345abcdef\"}")
        .priority(5)
        .timeout(200)
        .build();

    EnqueueTask enqueue =
        new EnqueueTask.Builder(task).workflowSid("WW0123456789abcdef0123456789abcdef").build();

    VoiceResponse twiml = new VoiceResponse.Builder().enqueue(enqueue).build();

    response.setContentType("application/xml");
    try {
      response.getWriter().print(twiml.toXml());
    } catch (TwiMLException e) {
      e.printStackTrace();
    }
  }
}
