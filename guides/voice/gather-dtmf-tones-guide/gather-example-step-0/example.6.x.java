import com.twilio.sdk.verbs.Gather;
import com.twilio.sdk.verbs.Redirect;
import com.twilio.sdk.verbs.Say;
import com.twilio.sdk.verbs.TwiMLResponse;
import com.twilio.sdk.verbs.TwiMLException;

import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

public class VoiceServlet extends HttpServlet {

    public void service(HttpServletRequest request, HttpServletResponse response) throws IOException {

        // Create a TwiML response and add our friendly message.
        TwiMLResponse twiml = new TwiMLResponse();

        Gather gather = new Gather();
        gather.setNumDigits(1);
        try {
            gather.append(new Say("For sales, press 1. For support, press 2."));
            twiml.append(gather);
            twiml.append(new Redirect("/voice"));
        } catch (TwiMLException e) {
            throw new RuntimeException(e);
        }

        response.setContentType("application/xml");
        response.getWriter().print(twiml.toXML());
    }
}

