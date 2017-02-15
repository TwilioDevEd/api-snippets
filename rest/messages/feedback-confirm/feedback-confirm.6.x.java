import java.io.IOException;
import java.util.HashMap;
import java.util.Map;

import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.twilio.sdk.TwilioRestClient;
import com.twilio.sdk.TwilioRestException;

@WebServlet(name = "Confirm", urlPatterns = {"/Confirm"})
public class Confirm extends HttpServlet {
  // Find your Account Sid and Token at twilio.com/user/account
  public static final String ACCOUNT_SID = "ACXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX";
  public static final String AUTH_TOKEN = "your_auth_token";

  public void service(HttpServletRequest request, HttpServletResponse response) throws IOException {
    String uniqueId = request.getParameter("id");
    // Lookup variable `uniqueId` in a database to find messageSid
    String messageSid = "SMXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX";

    TwilioRestClient client = new TwilioRestClient(ACCOUNT_SID, AUTH_TOKEN);

    Map<String, String> postParams = new HashMap<>();
    postParams.put("Outcome", "confirmed");

    try {
      client.request("/2010-04-01/Accounts/" + ACCOUNT_SID + "/Messages/" + sid + "/Feedback.json",
          "POST", postParams);
    } catch (TwilioRestException e) {
      e.printStackTrace();
    }
  }
}
