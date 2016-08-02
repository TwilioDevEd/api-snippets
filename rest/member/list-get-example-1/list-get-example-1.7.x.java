// Install the Java helper library from twilio.com/docs/java/install
import com.twilio.rest.Twilio;
import com.twilio.rest.resource.ResourceSet;
import com.twilio.rest.resource.api.v2010.account.queue.Member;

public class Example {
  // Find your Account Sid and Token at twilio.com/user/account
  public static final String ACCOUNT_SID = "ACXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX";
  public static final String AUTH_TOKEN = "your_auth_token";

  public static void main(String[] args) {
    Twilio.init(ACCOUNT_SID, AUTH_TOKEN);

    ResourceSet<Member> members = Member.read("QU5ef8732a3c49700934481addd5ce1659").execute();

    // Loop over members and print out a property for each one.
    for (Member member : members) {
      System.out.println(member.getPosition());
    }
  }
}
