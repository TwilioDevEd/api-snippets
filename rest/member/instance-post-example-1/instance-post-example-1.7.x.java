// Install the Java helper library from twilio.com/docs/java/install
import java.net.URI;
import java.net.URISyntaxException;

import com.twilio.rest.Twilio;
import com.twilio.rest.http.HttpMethod;
import com.twilio.rest.resource.api.v2010.account.queue.Member;

public class Example {
  // Find your Account Sid and Token at twilio.com/user/account
  public static final String ACCOUNT_SID = "ACXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX";
  public static final String AUTH_TOKEN = "your_auth_token";

  public static void main(String[] args) throws URISyntaxException {
    Twilio.init(ACCOUNT_SID, AUTH_TOKEN);

    // Get an object from its sid. If you do not have a sid,
    // check out the list resource examples on this page
    Member member = Member.update("QU5ef8732a3c49700934481addd5ce1659", "Front",
        new URI("http://demo.twilio.com/docs/voice.xml"), HttpMethod.POST).execute();

    System.out.println(member.getDateEnqueued());
  }
}
