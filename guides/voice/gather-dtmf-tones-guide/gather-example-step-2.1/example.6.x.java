import com.twilio.sdk.verbs.*;

import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

public class GatherServlet extends HttpServlet {

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
                        e.printStackTrace();
                    }
                    break;
                case "2":
                    try {
                        twiml.append(new Say("You need support. We will help!"));
                    } catch (TwiMLException e) {
                        e.printStackTrace();
                    }
                    break;
                default:
                    try {
                        twiml.append(new Say("Sorry, I don\'t understand that choice."));
                        twiml.append(new Redirect("/voice"));
                    } catch (TwiMLException e) {
                        e.printStackTrace();
                    }
                    break;
            }
        } else {
            try {
                twiml.append(new Redirect("/voice"));
            } catch (TwiMLException e) {
                e.printStackTrace();
            }
        }

        response.setContentType("application/xml");
        response.getWriter().print(twiml.toXML());
    }
}

