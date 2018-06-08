// Install the Java helper library from twilio.com/docs/java/install
import com.twilio.Twilio;
import com.twilio.rest.taskrouter.v1.workspace.task.Reservation;
import java.util.Arrays;
import java.net.URI;

public class Example {
  // Find your Account Sid and Token at twilio.com/user/account
  private static final String ACCOUNT_SID = "ACXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX";
  private static final String AUTH_TOKEN = "your_auth_token";
  private static final String WORKSPACE_SID = "WSXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX";
  private static final String TASK_SID = "WTXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX";
  private static final String RESERVATION_SID = "WRXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX";

  public static void main(String[] args) {
    Twilio.init(ACCOUNT_SID, AUTH_TOKEN);

     // Update a Reservation with a Conference instruction
    Reservation reservation = Reservation.updater(WORKSPACE_SID, TASK_SID, RESERVATION_SID)
        .setInstruction("conference")
        .setFrom("+18001231234")
        .setConferenceStatusCallback(URI.create("https://www.example.com/ConferenceEvents"))
        .setConferenceStatusCallbackEvent(Arrays.asList(
          Reservation.ConferenceEvent.START,
          Reservation.ConferenceEvent.END,
          Reservation.ConferenceEvent.JOIN,
          Reservation.ConferenceEvent.LEAVE,
          Reservation.ConferenceEvent.MUTE,
          Reservation.ConferenceEvent.HOLD)
        )
        .update();

    System.out.println(reservation.getDateUpdated());
  }
}
