// Install the Java helper library from twilio.com/docs/java/install
import com.twilio.Twilio;
import com.twilio.rest.api.v2010.account.Call;
import com.twilio.type.PhoneNumber;
import com.twilio.type.Sip;

public class Example {
  // Get your Account SID and Auth Token from https://twilio.com/console
  // To set up environment variables, see http://twil.io/secure
  public static final String ACCOUNT_SID = System.getenv("TWILIO_ACCOUNT_SID");
  public static final String AUTH_TOKEN = System.getenv("TWILIO_AUTH_TOKEN");

  public static void main(String[] args) {
    Twilio.init(ACCOUNT_SID, AUTH_TOKEN);

    Call call = Call
        .creator(new Sip("sip:kate@example.com"), new PhoneNumber("Jack"),
            "http://www.example.com/sipdial.xml")
        .setSipAuthUsername("jack")
        .setSipAuthPassword("secret")
        .create();

    System.out.println(call.getSid());
  }
}
