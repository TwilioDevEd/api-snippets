// NOTE: This example uses the next generation Twilio helper library - for more
// information on how to download and install this version, visit
// https://www.twilio.com/docs/libraries/java
import com.twilio.Twilio;
import com.twilio.rest.notify.v1.Service;

public class Example {
  // Find your Account Sid and Token at twilio.com/user/account
  public static final String ACCOUNT_SID = "ACXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX";
  public static final String AUTH_TOKEN = "your_auth_token";

  public static void main(String[] args) {
    // Initialize the client
    Twilio.init(ACCOUNT_SID, AUTH_TOKEN);

    // Update the service
    Service service = Service
        .updater("ISXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX")
        .setFriendlyName("Another Awesome Service")
        .setFacebookMessengerPageId("your_page_id")
        .setMessagingServiceSid("your_twilio_messaging_service_sid")
        .update();
  }
}
