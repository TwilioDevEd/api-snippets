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

    public void doPost(HttpServletRequest request, HttpServletResponse response) throws IOException {

        // Create a TwiML response and add our friendly message.
        TwiMLResponse twiml = new TwiMLResponse();

        String digits = request.getParameter("Digits");
        if (digits != null) {
            switch (digits) {
                case "1":
                    try {
                        twiml.append(new Say("You selected sales. Good for you!"));
                    } catch (TwiMLException e) {
                        throw new RuntimeException(e);
                    }
                    break;
                case "2":
                    try {
                        twiml.append(new Say("You need support. We will help!"));
                    } catch (TwiMLException e) {
                        throw new RuntimeException(e);
                    }
                    break;
                default:
                    try {
                        twiml.append(new Say("Sorry, I don\'t understand that choice."));
                    } catch (TwiMLException e) {
                        throw new RuntimeException(e);
                    }

                    appendGather(twiml);
                    break;
            }
        } else {
            appendGather(twiml);
        }

        response.setContentType("application/xml");
        response.getWriter().print(twiml.toXML());
    }

    private static TwiMLResponse appendGather(TwiMLResponse twiMLResponse) {
        Gather gather = new Gather();
        gather.setNumDigits(1);
        try {
            gather.append(new Say("For sales, press 1. For support, press 2."));
            twiMLResponse.append(gather);
            twiMLResponse.append(new Redirect("/voice"));
        } catch (TwiMLException e) {
            throw new RuntimeException(e);
        }

        return twiMLResponse;
    }
}

