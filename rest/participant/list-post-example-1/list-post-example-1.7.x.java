// Install the Java helper library from twilio.com/docs/java/install
import com.twilio.Twilio;
import com.twilio.rest.api.v2010.account.conference.Participant;
import com.twilio.type.PhoneNumber;

public class Example {
  /// Find your Account Sid and Token at twilio.com/user/account
  public static final String ACCOUNT_SID = "ACXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX";
  public static final String AUTH_TOKEN = "your_auth_token";

  public static void main(String[] args) {
    Twilio.init(ACCOUNT_SID, AUTH_TOKEN);

    String conferenceFriendlyName = "AgentConf12";
    PhoneNumber from = new PhoneNumber("+18180021216");
    PhoneNumber to = new PhoneNumber("+15624421212");
    Participant participant = Participant
        .creator(conferenceFriendlyName, from, to)
        .create();

    System.out.println(participant.getCallSid());
  }
}
