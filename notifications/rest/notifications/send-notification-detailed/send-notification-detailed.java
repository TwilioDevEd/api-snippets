// NOTE: This example uses the next generation Twilio helper library - for more
// information on how to download and install this version, visit
// https://www.twilio.com/docs/libraries/java
import com.twilio.sdk.Twilio;
import com.twilio.sdk.creator.notifications.v1.service.NotificationCreator;
import com.twilio.sdk.resource.notifications.v1.service.Notification;

public class CreateDetailedNotification {
  // Find your Account Sid and Token at twilio.com/user/account
  public static final String ACCOUNT_SID = "{{ account_sid }}";
  public static final String AUTH_TOKEN = "{{ auth_token }}";

  public static void main(String args[]) {
    // Initialize the client
    Twilio.init(ACCOUNT_SID, AUTH_TOKEN);

    // Create a notification
    NotificationCreator creator = Notification.create("ISxxx");
    creator.setIdentity("Bob");
    creator.setTitle("Generic loooooooong title for all Bindings");
    creator.setBody("This is the body for all Bindings");
    creator.setGcm("{\"notification\":{\"tag\":\"MyTag\"}}");
    creator.setApn("{\"aps\":{\"title\":\"Short title for Watch.\"}}");

    Notification notification = creator.execute();

    System.out.println(notification.toString());
  }
}