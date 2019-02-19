// Install the Java helper library from twilio.com/docs/java/install
import java.net.URI;
import java.net.URISyntaxException;

import com.twilio.Twilio;
import com.twilio.rest.fax.v1.Fax;
import com.twilio.type.PhoneNumber;
import com.twilio.type.Sip;

public class Example {
  // Find your Account Sid and Token at twilio.com/user/account
  public static final String ACCOUNT_SID = "AC850685e1d9b8c09dae0b938923dc0d42";
  public static final String AUTH_TOKEN = "your_auth_token";

  public static void main(String[] args) throws URISyntaxException {
    Twilio.init(ACCOUNT_SID, AUTH_TOKEN);

    String from = "Jack";
    String to = "sip:kate@example.com?hatchkey=4815162342;transport=TCP";
    URI mediaUrl = new URI("https://www.twilio.com/docs/documents/25/justthefaxmaam.pdf");
    Fax fax = Fax.creator(to, mediaUrl).setFrom(from).create();

    System.out.println(fax.getSid());
  }
}
