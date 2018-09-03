// Install the Java helper library from twilio.com/docs/java/install
import java.util.ArrayList;
import java.util.List;
import org.apache.http.NameValuePair;
import org.apache.http.message.BasicNameValuePair;

import com.twilio.sdk.TwilioRestException;
import com.twilio.sdk.TwilioTaskRouterClient;
import com.twilio.sdk.resource.instance.taskrouter.Reservation;
import com.twilio.sdk.resource.instance.taskrouter.Task;
import com.twilio.sdk.resource.instance.taskrouter.Workspace;

public class Example { 

  // Find your Account Sid and Token at twilio.com/user/account
  private static final String ACCOUNT_SID = "ACXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX";
  private static final String AUTH_TOKEN = "your_auth_token";
  private static final String WORKSPACE_SID = "WSXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX";
  private static final String TASK_SID = "WTXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX";
  private static final String RESERVATION_SID = "WRXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX";

  public static void main(String[] args) throws TwilioRestException {
    TwilioTaskRouterClient client = new TwilioTaskRouterClient(ACCOUNT_SID, AUTH_TOKEN);

    Reservation reservation = client.getReservation(WORKSPACE_SID, TASK_SID, RESERVATION_SID);

    // Update a Reservation with a Conference instruction
    List<NameValuePair> params = new ArrayList<NameValuePair>();
    params.add(new BasicNameValuePair("Instruction", "conference"));
    params.add(new BasicNameValuePair("From", "+18001231234"));
    params.add(new BasicNameValuePair("ConferenceStatusCallback", "https://www.example.com/ConferenceEvents"));
    params.add(new BasicNameValuePair("ConferenceStatusCallbackEvent", "start"));
    params.add(new BasicNameValuePair("ConferenceStatusCallbackEvent", "end"));
    params.add(new BasicNameValuePair("ConferenceStatusCallbackEvent", "join"));
    params.add(new BasicNameValuePair("ConferenceStatusCallbackEvent", "leave"));
    params.add(new BasicNameValuePair("ConferenceStatusCallbackEvent", "mute"));
    params.add(new BasicNameValuePair("ConferenceStatusCallbackEvent", "hold"));
    reservation.update(params);
  }
}