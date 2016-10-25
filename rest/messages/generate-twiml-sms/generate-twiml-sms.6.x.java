package com.twilio;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

import com.twilio.sdk.verbs.TwiMLResponse;
import com.twilio.sdk.verbs.TwiMLException;
import com.twilio.sdk.verbs.Message;

public class TwilioServlet extends HttpServlet {
  // service() responds to both GET and POST requests.
  // You can also use doGet() or doPost()
  public void service(HttpServletRequest request, HttpServletResponse response) throws IOException {
    TwiMLResponse twiml = new TwiMLResponse();
    Message message = new Message("The Robots are coming! Head for the hills!");
    try {
        twiml.append(message);
    } catch (TwiMLException e) {
        e.printStackTrace();
    }

    response.setContentType("application/xml");
    response.getWriter().print(twiml.toXML());
  }
}
