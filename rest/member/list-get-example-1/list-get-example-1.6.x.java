// Install the Java helper library from twilio.com/docs/java/install
import com.twilio.sdk.TwilioRestClient;
import com.twilio.sdk.TwilioRestException;
import com.twilio.sdk.resource.instance.Member;
import com.twilio.sdk.resource.list.MemberList;

public class Example { 

  // Find your Account Sid and Token at twilio.com/user/account
  public static final String ACCOUNT_SID = "ACXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX";
  public static final String AUTH_TOKEN = "your_auth_token";

  public static void main(String[] args) throws TwilioRestException {
    TwilioRestClient client = new TwilioRestClient(ACCOUNT_SID, AUTH_TOKEN);
    
    MemberList members = client.getAccount().getQueue("QU5ef8732a3c49700934481addd5ce1659").getMembers();
    
    // Loop over members and print out a property for each one.
    for (Member member : members) {
      System.out.println(member.getPosition());
    }
    
  }
}