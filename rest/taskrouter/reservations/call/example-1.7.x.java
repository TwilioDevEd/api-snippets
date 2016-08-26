// Install the Java helper library from twilio.com/docs/java/install
import com.twilio.Twilio;
import com.twilio.rest.taskrouter.v1.workspace.task.Reservation;

public class Example {
  // Find your Account Sid and Token at twilio.com/user/account
  private static final String ACCOUNT_SID = "ACXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX";
  private static final String AUTH_TOKEN = "your_auth_token";
  private static final String WORKSPACE_SID = "WSXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX";
  private static final String TASK_SID = "WTXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX";
  private static final String RESERVATION_SID = "WRXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX";

  public static void main(String[] args) {
    Twilio.init(ACCOUNT_SID, AUTH_TOKEN);

    // call using a reservation
    Reservation reservation = Reservation.update(WORKSPACE_SID, TASK_SID, RESERVATION_SID)
        .setInstruction("Call")
        .setCallFrom("+15558675309").setCallUrl("http://example.com/agent_answer")
        .setCallStatusCallbackUrl("http://example.com/agent_answer_status_callback")
        .setCallAccept(true)
        .execute();

    System.out.println(reservation.getDateUpdated());
  }
}
