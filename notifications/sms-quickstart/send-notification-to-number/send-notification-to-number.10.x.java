// Install the Java helper library from twilio.com/docs/java/install
import com.twilio.Twilio;
import com.twilio.rest.notify.v1.service.Notification;

public class Example {
  // Get your Account SID and Auth Token from https://twilio.com/console
  // To set up environment variables, see http://twil.io/secure
  public static final String ACCOUNT_SID = System.getenv("TWILIO_ACCOUNT_SID");
  public static final String AUTH_TOKEN = System.getenv("TWILIO_AUTH_TOKEN");

  public static final String SERVICE_SID = System.getenv("TWILIO_SERVICE_SID");

  public static void main(String[] args) {
    // Initialize the client
    Twilio.init(ACCOUNT_SID, AUTH_TOKEN);

    Notification notification = Notification
        .creator(SERVICE_SID)
        .setBody("Knok-Knok! This is your first Notify SMS")
        .setToBinding("{\"binding_type\":\"sms\",\"address\":\"+1651000000000\"}")
        .create();

    System.out.println(notification.getSid());
  }
}
