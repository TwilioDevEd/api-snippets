// NOTE: This example uses the next generation Twilio helper library - for more
// information on how to download and install this version, visit
// https://www.twilio.com/docs/libraries/java
import java.util.Arrays;
import java.util.List;
import com.twilio.Twilio;
import com.twilio.rest.notify.v1.service.Notification;

public class Example {
  // Find your Account Sid and Token at twilio.com/user/account
  public static final String ACCOUNT_SID = "ACXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX";
  public static final String AUTH_TOKEN = "your_auth_token";

  public static final String SERVICE_SID = "ISXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX";

  public static void main(String[] args) {
    // Initialize the client
    Twilio.init(ACCOUNT_SID, AUTH_TOKEN);

    List<String> toBindings = Arrays.asList(
    "{\"binding_type\":\"sms\",\"address\":\"+15555555555\"}",
    "{\"binding_type\":\"facebook-messenger\",\"address\":\"123456789123\"}");

    Notification notification = Notification
        .creator(SERVICE_SID)
        .setBody("Hello Bob")
        .setToBinding(toBindings)
        .create();

    System.out.println(notification.getSid());
  }
}
