// Install the Java helper library from twilio.com/docs/java/install
import com.twilio.sdk.TwilioRestClient;
import com.twilio.sdk.TwilioRestException;
import com.twilio.sdk.resource.instance.Participant;
import com.twilio.sdk.resource.list.ParticipantList;

public class Example { 

  // Find your Account Sid and Token at twilio.com/user/account
  public static final String ACCOUNT_SID = "ACXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX";
  public static final String AUTH_TOKEN = "your_auth_token";

  public static void main(String[] args) throws TwilioRestException {
    TwilioRestClient client = new TwilioRestClient(ACCOUNT_SID, AUTH_TOKEN);

    
    
    ParticipantList participants = client.getAccount().getConference("CFbbe4632a3c49700934481addd5ce1659").getParticipants();
    
    // Loop over participants and print out a property for each one.
    for (Participant participant : participants) {
      System.out.println(participant.isMuted());
    }
    
  }
}