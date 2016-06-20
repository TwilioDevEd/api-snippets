// Install the Java helper library from twilio.com/docs/java/install
import java.util.HashMap;
import java.util.Map;

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

  public static void main(String[] args) throws TwilioRestException {
    TwilioTaskRouterClient client = new TwilioTaskRouterClient(ACCOUNT_SID, AUTH_TOKEN);

    // accept a reservation
    Task task = client.getTask(WORKSPACE_SID, TASK_SID);
    for(Reservation reservation : task.getReservations()) {
        Map<String, String> params = new HashMap<String, String>();
        params.put("ReservationStatus", "accepted");
        reservation.update(params);
    }

    // accept a reservation #2
    task = client.getTask(WORKSPACE_SID, TASK_SID);
    for(Reservation reservation : task.getReservations()) {
        reservation.accept();
    }
  }
}