// Install the Java helper library from twilio.com/docs/java/install
import com.twilio.Twilio;
import com.twilio.rest.api.v2010.account.sip.Domain;

public class Example {
  /// Find your Account Sid and Token at twilio.com/user/account
  public static final String ACCOUNT_SID = "ACXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX";
  public static final String AUTH_TOKEN = "your_auth_token";

  public static void main(String[] args) {
    Twilio.init(ACCOUNT_SID, AUTH_TOKEN);

    Domain domain = Domain.creator("marlo.sip.twilio.com")
        .setFriendlyName("My Domain")
        .setVoiceUrl("https://demo.twilio.com/welcome")
        .setAuthType("IP_ACL")
        .create();

    System.out.println(domain.getSid());
  }
}
