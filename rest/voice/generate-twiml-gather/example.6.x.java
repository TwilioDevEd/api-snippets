package com.twilio;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.HashMap;

import com.twilio.sdk.verbs.TwiMLResponse;
import com.twilio.sdk.verbs.TwiMLException;
import com.twilio.sdk.verbs.Say;
import com.twilio.sdk.verbs.Play;
import com.twilio.sdk.verbs.Gather;

public class TwilioServlet extends HttpServlet {

    public void service(HttpServletRequest request, HttpServletResponse response) throws IOException {
        String message;
        // Use the caller's name
        message = "Hello. It's me.";

        // Create a TwiML response and add our friendly message.
        TwiMLResponse twiml = new TwiMLResponse();
        Say say = new Say(message);

        // Play an MP3 for incoming callers.
        Play play = new Play("http://howtodocs.s3.amazonaws.com/ahoyhoy.mp3");

        Gather gather = new Gather();
        gather.setAction("/handle-gather");
        gather.setNumDigits(1);
        gather.setMethod("POST");
        Say sayInGather = new Say("To speak to a real person, press 1. " + 
                "Press 2 to record a message for a Twilio educator. " + 
                "Press any other key to start over.");
        try {
            gather.append(sayInGather);
            twiml.append(say);
            twiml.append(play);
            twiml.append(gather);
        } catch (TwiMLException e) {
            e.printStackTrace();
        }

        response.setContentType("application/xml");
        response.getWriter().print(twiml.toXML());
    }
}