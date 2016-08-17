package com.twilio;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import java.io.IOException;

import com.twilio.sdk.verbs.TwiMLResponse;
import com.twilio.sdk.verbs.TwiMLException;
import com.twilio.sdk.verbs.Say;
import com.twilio.sdk.verbs.Play;

public class TwilioServlet extends HttpServlet {

    public void service(HttpServletRequest request, HttpServletResponse response) throws IOException {

        // Create a TwiML response and add our friendly message.
        TwiMLResponse twiml = new TwiMLResponse();
        Say say = new Say("Hello. It's me.");
        Play play = new Play("http://howtodocs.s3.amazonaws.com/ahoyhoy.mp3");
        try {
            twiml.append(say);
            twiml.append(play);
        } catch (TwiMLException e) {
            e.printStackTrace();
        }

        response.setContentType("application/xml");
        response.getWriter().print(twiml.toXML());
    }
}