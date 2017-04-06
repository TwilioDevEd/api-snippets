// Install the Java helper library from twilio.com/docs/libraries/java
import com.twilio.Twilio;
import com.twilio.rest.api.v2010.account.Message;
import com.twilio.type.PhoneNumber;

public class Example {
  // Find your Account Sid and Token at twilio.com/console
  public static final String ACCOUNT_SID = "ACXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX";
  public static final String AUTH_TOKEN = "your_auth_token";

  public static void main(String[] args) {
    Twilio.init(ACCOUNT_SID, AUTH_TOKEN);

    String from = "+15017250604";
    String to = "+15558675309";
    URI mediaUrl = new URI("https://www.twilio.com/docs/documents/25/justthefaxmaam.pdf");
    Fax fax = Fax.creator(from, to, mediaUrl).create();

    System.out.println(fax.getSid());
  }
}
