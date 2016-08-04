// Install the Java helper library from twilio.com/docs/java/install
import java.net.URI;
import java.net.URISyntaxException;

import com.twilio.rest.Twilio;
import com.twilio.rest.resource.api.v2010.account.Call;
import com.twilio.rest.type.PhoneNumber;

public class Example {
  // Find your Account Sid and Token at twilio.com/user/account
  public static final String ACCOUNT_SID = "ACXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX";
  public static final String AUTH_TOKEN = "your_auth_token";

  public static void main(String[] args) throws URISyntaxException {
    Twilio.init(ACCOUNT_SID, AUTH_TOKEN);

    Call call = Call
        .create(new PhoneNumber("sip:kate@example.com"), new PhoneNumber("Jack"),
            new URI("http://www.example.com/sipdial.xml"))
        .setSipAuthPassword("secret").setSipAuthUsername("jack").execute();

    System.out.println(call.getSid());
  }
}
