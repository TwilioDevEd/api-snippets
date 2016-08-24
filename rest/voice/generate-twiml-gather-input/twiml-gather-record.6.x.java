package com.twilio;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

import com.twilio.sdk.verbs.TwiMLResponse;
import com.twilio.sdk.verbs.TwiMLException;
import com.twilio.sdk.verbs.Dial;
import com.twilio.sdk.verbs.Record;
import com.twilio.sdk.verbs.Say;

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