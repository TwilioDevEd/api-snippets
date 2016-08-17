package com.twilio;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.HashMap;

import com.twilio.sdk.verbs.TwiMLResponse;
import com.twilio.sdk.verbs.TwiMLException;
import com.twilio.sdk.verbs.Dial;
import com.twilio.sdk.verbs.Gather;
import com.twilio.sdk.verbs.Play;
import com.twilio.sdk.verbs.Say;


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

public class TwilioHandleKeyServlet extends HttpServlet {

    public void service(HttpServletRequest request, HttpServletResponse response) throws IOException {

        String digits = request.getParameter("Digits");
        TwiMLResponse twiml = new TwiMLResponse();
        if (digits != null && digits.equals("1")) {
            // Connect 310 555 1212 to the incoming caller.
            Dial dial = new Dial("+13105551212");

            // If the above dial failed, say an error message.
            Say say = new Say("The call failed, or the remote party hung up. Goodbye.");
            try { 
                twiml.append(dial);
                twiml.append(say);
            } catch (TwiMLException e) {
                e.printStackTrace();
            }
        } else if (digits != null && digits.equals("2")) {
            Say pleaseLeaveMessage = new Say("Record your message after the tone.");
            // Record the caller's voice.
            Record record = new Record();
            record.setMaxLength(30);
            // You may need to change this to point to the location of your
            // servlet 
            record.setAction("/handle-recording");
            try {
                twiml.append(pleaseLeaveMessage);
                twiml.append(record);
            } catch (TwiMLException e) {
                e.printStackTrace();
            }
        } else {
            response.sendRedirect("/twiml");
            return;
        }

        response.setContentType("application/xml");
        response.getWriter().print(twiml.toXML());
    }
}

public class TwilioHandleRecordingServlet extends HttpServlet {

    public void service(HttpServletRequest request, HttpServletResponse response) throws IOException {

        String recordingUrl = request.getParameter("RecordingUrl");
        TwiMLResponse twiml = new TwiMLResponse();
        if (recordingUrl != null) {
            try {
                twiml.append(new Say("Listen to your recorded message."));
                twiml.append(new Play(recordingUrl));
                twiml.append(new Say("Goodbye"));
            } catch (TwiMLException e) {
                e.printStackTrace();
            }
        } else {
            response.sendRedirect("/twiml");
            return;
        }

        response.setContentType("application/xml");
        response.getWriter().print(twiml.toXML());
    }
}