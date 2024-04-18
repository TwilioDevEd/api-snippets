import java.io.IOException;
import java.util.List;
import java.util.Arrays;

import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.twilio.jwt.client.ClientCapability;
import com.twilio.jwt.client.IncomingClientScope;
import com.twilio.jwt.client.OutgoingClientScope;
import com.twilio.jwt.client.Scope;

public class TwilioServlet extends HttpServlet {

  // Get your Account SID and Auth Token from https://twilio.com/console
  // To set up environment variables, see http://twil.io/secure
  public static final String ACCOUNT_SID = System.getenv("TWILIO_ACCOUNT_SID");
  public static final String AUTH_TOKEN = System.getenv("TWILIO_AUTH_TOKEN");
  // Find an application Sid from twilio.com/user/account/apps
  public static final String APP_SID = System.getenv("TWILIO_APP_SID");

  public void service(HttpServletRequest request, HttpServletResponse response) throws IOException {
    OutgoingClientScope outgoingScope = new OutgoingClientScope.Builder(APP_SID).build();
    IncomingClientScope incomingScope = new IncomingClientScope("joey");

    List<Scope> scopes = Arrays.asList(outgoingScope, incomingScope);

    ClientCapability capability = new ClientCapability.Builder(ACCOUNT_SID, AUTH_TOKEN)
        .scopes(scopes)
        .build();

    String token = capability.toJwt();

    response.setContentType("application/jwt");
    response.getWriter().print(token);
  }
}
