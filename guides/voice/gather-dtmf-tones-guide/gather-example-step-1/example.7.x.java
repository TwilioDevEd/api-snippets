import com.twilio.twiml.*;

import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

public class VoiceServlet extends HttpServlet {

    public void doPost(HttpServletRequest request, HttpServletResponse response) throws IOException {

        // Create a TwiML response and add our friendly message.
        VoiceResponse.Builder builder = new VoiceResponse.Builder();

        String digits = request.getParameter("Digits");
        if (digits != null) {
            switch (digits) {
                case "1":
                    builder.say(new Say.Builder("You selected sales. Good for you!").build());
                    break;
                case "2":
                    builder.say(new Say.Builder("You need support. We will help!").build());
                    break;
                default:
                    builder.say(new Say.Builder("Sorry, I don\'t understand that choice.").build());
                    appendGather(builder);
                    break;
            }
        } else {
            appendGather(builder);
        }

        response.setContentType("application/xml");
        try {
            response.getWriter().print(builder.build().toXml());
        } catch (TwiMLException e) {
            throw new RuntimeException(e);
        }
    }

    private static void appendGather(VoiceResponse.Builder builder) {
        builder.gather(new Gather.Builder()
                        .numDigits(1)
                        .say(new Say.Builder("For sales, press 1. For support, press 2.").build())
                        .build()
                )
                .redirect(new Redirect.Builder().url("/voice").build());
    }
}

