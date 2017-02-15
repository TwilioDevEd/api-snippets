// Install the Java helper library from twilio.com/docs/java/install
import com.twilio.Twilio;
import com.twilio.rest.notify.v1.service.Notification;

public class Example {
  // Find your Account Sid and Token at twilio.com/user/account
  public static final String ACCOUNT_SID = "ACCOUNT_SID";
  public static final String AUTH_TOKEN = "AUTH_TOKEN";

  public static final String SERVICE_SID = "ISXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX";

  public static void main(String[] args) {
    // Initialize the client
    Twilio.init(ACCOUNT_SID, AUTH_TOKEN);

    Notification notification = Notification
        .creator(SERVICE_SID)
        .setBody("A new Rogue One trailer has been released!")
        .setTag("rogue_one")
        .setSms("{\"from\":\"+16516667788\"}")
        .create();

    System.out.println(notification.getSid());
  }
}
