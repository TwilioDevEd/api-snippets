package com.twilio;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

import com.twilio.sdk.verbs.TwiMLResponse;
import com.twilio.sdk.verbs.TwiMLException;
import com.twilio.sdk.verbs.Message;
import com.twilio.sdk.verbs.Body;
import com.twilio.sdk.verbs.Media;

public class TwilioServlet extends HttpServlet {
  // service() responds to both GET and POST requests.
  // You can also use doGet() or doPost()
  public void service(HttpServletRequest request, HttpServletResponse response) throws IOException {
    TwiMLResponse twiml = new TwiMLResponse();
    Message message = new Message();
    try {
      message.append(new Body("The Robots are coming! Head for the hills!"));
      message.append(new Media("https://farm8.staticflickr.com/7090/6941316406_80b4d6d50e_z_d.jpg"));
      twiml.append(message);
    } catch (TwiMLException e) {
      e.printStackTrace();
    }

    response.setContentType("text/xml");
    response.getWriter().print(twiml.toXML());
  }
}
