package com.twilio;

import java.io.IOException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.twilio.sdk.verbs.TwiMLResponse;
import com.twilio.sdk.verbs.TwiMLException;
import com.twilio.sdk.verbs.Say;
import com.twilio.sdk.verbs.Dial;
import com.twilio.sdk.verbs.Number;

@WebServlet(name = "TwilioServlet", urlPatterns = {"/voice"})
public class TwilioServlet extends HttpServlet {

    // service() responds to both GET and POST requests.
    // You can also use doGet() or doPost()
    public void service(HttpServletRequest request, HttpServletResponse response) throws IOException {
        TwiMLResponse twiml = new TwiMLResponse();
        try {
            String to = request.getParameter("To");
            if (to != null) {
                Dial dial = new Dial();
                dial.setCallerId("+15017122661");
                dial.append(new Number(to));
                twiml.append(dial);
            } else {
                twiml.append(new Say("Thanks for calling!"));
            }
        } catch (TwiMLException e) {
            e.printStackTrace();
        }

        response.setContentType("application/xml");
        response.getWriter().print(twiml.toXML());
    }
}
