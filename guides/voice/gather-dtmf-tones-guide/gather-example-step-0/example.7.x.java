import com.twilio.twiml.voice.Gather;
import com.twilio.twiml.voice.Redirect;
import com.twilio.twiml.voice.Say;
import com.twilio.twiml.TwiML;
import com.twilio.twiml.TwiMLException;
import com.twilio.twiml.VoiceResponse;

import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

public class VoiceServlet extends HttpServlet {

    public void doPost(HttpServletRequest request, HttpServletResponse response) throws IOException {

        // Create a TwiML response and add our friendly message.
        TwiML twiml = new VoiceResponse.Builder()
                .gather(
                        new Gather.Builder()
                                .numDigits(1)
                                .say(new Say.Builder("For sales, press 1. For support, press 2.").build())
                                .build()
                )
                .redirect(new Redirect.Builder().url("/voice").build())
                .build();

        response.setContentType("application/xml");
        try {
            response.getWriter().print(twiml.toXml());
        } catch (TwiMLException e) {
            throw new RuntimeException(e);
        }
    }
}

