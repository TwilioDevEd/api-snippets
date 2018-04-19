// Install the Java helper library from twilio.com/docs/java/install
import java.net.URI;
import java.net.URISyntaxException;

import com.twilio.Twilio;
import com.twilio.rest.api.v2010.account.Call;
import com.twilio.type.PhoneNumber;

public class Example {
  // Find your Account Sid and Token at twilio.com/user/account
  public static final String SUBACCOUNT_SID = "ACXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX";
  public static final String SUBACCOUNT_AUTH_TOKEN = "your_auth_token";

  public static void main(String[] args) throws URISyntaxException {
    Twilio.init(SUBACCOUNT_SID, SUBACCOUNT_AUTH_TOKEN);

    Call.creator(new PhoneNumber("+16518675310"), new PhoneNumber("+14158141829"),
        new URI("http://twimlets.com/message?Message%5B0%5D=Hello%20from%20your%20subaccount"))
            .create();
  }
}
