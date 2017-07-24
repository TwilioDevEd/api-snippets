import com.twilio.Twilio;
import com.twilio.rest.preview.proxy.Service;

public class Example {
  // Find your Account Sid and Token at twilio.com/user/account
  public static final String ACCOUNT_SID = "ACXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX";
  public static final String AUTH_TOKEN = "your_auth_token";

  public static void main(String[] args) {
    Twilio.init(ACCOUNT_SID, AUTH_TOKEN);

    Service service = Service.creator()
      .setFriendlyName("My Awesome Service")
      .setCallbackUrl("https://www.example.com/")
      .create();

    System.out.println(service.getSid());
  }
}
