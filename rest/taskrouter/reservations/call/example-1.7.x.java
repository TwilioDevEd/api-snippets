// Install the Java helper library from twilio.com/docs/java/install
import com.twilio.Twilio;
import com.twilio.rest.taskrouter.v1.workspace.task.Reservation;

public class Example {
  // Get your Account SID and Auth Token from https://twilio.com/console
  // To set up environment variables, see http://twil.io/secure
  private static final String ACCOUNT_SID = System.getenv("TWILIO_ACCOUNT_SID");
  private static final String AUTH_TOKEN = System.getenv("TWILIO_AUTH_TOKEN");
  private static final String WORKSPACE_SID = "WSXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX";
  private static final String TASK_SID = "WTXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX";
  private static final String RESERVATION_SID = "WRXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX";

  public static void main(String[] args) {
    Twilio.init(ACCOUNT_SID, AUTH_TOKEN);

    // call using a reservation
    Reservation reservation = Reservation.updater(WORKSPACE_SID, TASK_SID, RESERVATION_SID)
        .setInstruction("Call")
        .setCallFrom("+15558675310").setCallUrl("http://example.com/agent_answer")
        .setCallStatusCallbackUrl("http://example.com/agent_answer_status_callback")
        .setCallAccept(true)
        .update();

    System.out.println(reservation.getDateUpdated());
  }
}
