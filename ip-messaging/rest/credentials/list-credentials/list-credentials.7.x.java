// Install the Java helper library from twilio.com/docs/java/install 
import com.twilio.Twilio;
import com.twilio.base.ResourceSet;
import com.twilio.rest.chat.v2.Credential;

public class Example {
  // Get your Account SID and Auth Token from https://twilio.com/console
  // To set up environment variables, see http://twil.io/secure
  public static final String ACCOUNT_SID = System.getenv("TWILIO_ACCOUNT_SID");
  public static final String AUTH_TOKEN = System.getenv("TWILIO_AUTH_TOKEN");

  public static void main(String[] args) {
    // Initialize the client
    Twilio.init(ACCOUNT_SID, AUTH_TOKEN);

    // Retrieve the list of credentials
    ResourceSet<Credential> credentials = Credential.reader().read();

    for (Credential credential : credentials) {
      System.out.println(credential.getSid());
    }
  }
}
