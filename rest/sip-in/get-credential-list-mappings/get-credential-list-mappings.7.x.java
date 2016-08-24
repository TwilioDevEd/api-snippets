// Install the Java helper library from twilio.com/docs/java/install
import com.twilio.Twilio;
import com.twilio.base.ResourceSet;
import com.twilio.rest.api.v2010.account.sip.domain.CredentialListMapping;

public class Example {
  /// Find your Account Sid and Token at twilio.com/user/account
  public static final String ACCOUNT_SID = "ACXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX";
  public static final String AUTH_TOKEN = "your_auth_token";

  public static void main(String[] args) {
    Twilio.init(ACCOUNT_SID, AUTH_TOKEN);

    ResourceSet<CredentialListMapping> credentialListMappings =
        CredentialListMapping.read("SD32a3c49700934481addd5ce1659f04d2").execute();

    // Loop over credentialListMappings and print out a property for each one.
    for (CredentialListMapping credentialListMapping : credentialListMappings) {
      System.out.println(credentialListMapping.getFriendlyName());
    }
  }
}
