package com.twilio.servlets;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.twilio.sdk.verbs.Say;
import com.twilio.sdk.verbs.TwiMLException;
import com.twilio.sdk.verbs.TwiMLResponse;

@SuppressWarnings("serial")
@WebServlet("/voice")
public class IncomingCallServlet extends HttpServlet {

  // Handle HTTP POST to /voice
  protected void doPost(HttpServletRequest request, HttpServletResponse response)
      throws ServletException, IOException {
    // Create a TwiML builder object
    TwiMLResponse twiml = new TwiMLResponse();
    try {
      Say message = new Say("hello world!");
      message.setVoice("alice");
      twiml.append(message);
    } catch (TwiMLException e) {
      e.printStackTrace();
    }
    
    // Render TwiML as XML
    response.setContentType("text/xml");
    response.getWriter().print(twiml.toXML());
  }
}
