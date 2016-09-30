// Install the Java helper library from twilio.com/docs/java/install
import com.twilio.Twilio;
import com.twilio.http.HttpMethod;
import com.twilio.rest.api.v2010.account.IncomingPhoneNumber;
import com.twilio.type.PhoneNumber;

public class Example {
  // Find your Account Sid and Token at twilio.com/user/account
  public static final String ACCOUNT_SID = "ACXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX";
  public static final String AUTH_TOKEN = "your_auth_token";

  public static void main(String[] args) {
    Twilio.init(ACCOUNT_SID, AUTH_TOKEN);

    IncomingPhoneNumber number = IncomingPhoneNumber.create(new PhoneNumber("+15105647903"))
        .setFriendlyName("My Company Line").setVoiceUrl("http://demo.twilio.com/docs/voice.xml")
        .setVoiceMethod(HttpMethod.GET).execute();

    System.out.println(number.getSid());
  }
}
