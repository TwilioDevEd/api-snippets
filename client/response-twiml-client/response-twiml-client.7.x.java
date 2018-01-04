import java.io.IOException;

import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.twilio.twiml.*;
import com.twilio.twiml.voice.Number;

@WebServlet(name = "TwilioServlet", urlPatterns = {"/voice"})
public class TwilioServlet extends HttpServlet {
  // service() responds to both GET and POST requests.
  // You can also use doGet() or doPost()
  public void service(HttpServletRequest request, HttpServletResponse response) throws IOException {
    String to = request.getParameter("To");

    VoiceResponse.Builder responseBuilder = new VoiceResponse.Builder();

    if (to != null) {
      Dial.Builder dialBuilder = new Dial.Builder().callerId("+15017250604");

      // wrap the phone number or client name in the appropriate TwiML verb
      // by checking if the number given has only digits and format symbols
      if (to.matches("^[\\d\\+\\-\\(\\) ]+$")) {
        Number number = new Number.Builder(to).build();
        dialBuilder = dialBuilder.number(number);
      } else {
        Client client = new Client.Builder(to).build();
        dialBuilder = dialBuilder.client(client);
      }

      Dial dial = dialBuilder.build();

      responseBuilder = responseBuilder.dial(dial);
    } else {
      Say say = new Say.Builder("Thanks for calling!").build();
      responseBuilder = responseBuilder.say(say);
    }

    VoiceResponse twiml = responseBuilder.build();

    response.setContentType("application/xml");

    try {
      response.getWriter().print(twiml.toXml());
    } catch (TwiMLException e) {
      e.printStackTrace();
    }
  }
}
