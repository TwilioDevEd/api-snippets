// Install the Java helper library from twilio.com/docs/java/install
import com.twilio.Twilio;
import com.twilio.base.ResourceSet;
import com.twilio.rest.api.v2010.account.sip.domain.CredentialListMapping;

public class Example {
  // Get your Account SID and Auth Token from https://twilio.com/console
  // To set up environment variables, see http://twil.io/secure
  public static final String ACCOUNT_SID = System.getenv("TWILIO_ACCOUNT_SID");
  public static final String AUTH_TOKEN = System.getenv("TWILIO_AUTH_TOKEN");

  public static void main(String[] args) {
    Twilio.init(ACCOUNT_SID, AUTH_TOKEN);

    ResourceSet<CredentialListMapping> credentialListMappings =
        CredentialListMapping.reader("SD32a3c49700934481addd5ce1659f04d2").read();

    // Loop over credentialListMappings and print out a property for each one.
    for (CredentialListMapping credentialListMapping : credentialListMappings) {
      System.out.println(credentialListMapping.getFriendlyName());
    }
  }
}
