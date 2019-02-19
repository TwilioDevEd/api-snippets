// Install the Java helper library from twilio.com/docs/java/install
import com.twilio.Twilio;
import com.twilio.base.ResourceSet;
import com.twilio.rest.api.v2010.account.conference.Participant;

public class Example {
  /// Find your Account Sid and Token at twilio.com/user/account
  public static final String ACCOUNT_SID = "ACXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX";
  public static final String AUTH_TOKEN = "your_auth_token";

  public static void main(String[] args) {
    Twilio.init(ACCOUNT_SID, AUTH_TOKEN);

    ResourceSet<Participant> participants = Participant
        .reader("CFbbe4632a3c49700934481addd5ce1659")
        .read();

    // Loop over participants and print out a property for each one.
    for (Participant participant : participants) {
      System.out.println(participant.getMuted());
    }
  }
}
