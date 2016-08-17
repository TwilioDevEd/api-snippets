package com.twilio;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

import com.twilio.twiml.Say;
import com.twilio.twiml.Sms;
import com.twilio.twiml.TwiMLException;
import com.twilio.twiml.VoiceResponse;

public class TwilioServlet extends HttpServlet {
  // service() responds to both GET and POST requests.
  // You can also use doGet() or doPost()
  public void service(HttpServletRequest request, HttpServletResponse response) throws IOException {
    Say say = new Say.Builder("Hello Monkey! You will get an SMS message soon.").build();
    Sms sms = new Sms.Builder("Here it is!").build();

    VoiceResponse response = new VoiceResponse.Builder().say(say).sms(sms).build();

    response.setContentType("application/xml");

    try {
      response.getWriter().print(response.toXml());
    } catch (TwiMLException e) {
      e.printStackTrace();
    }
  }
}
