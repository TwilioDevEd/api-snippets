// Install the Java helper library from twilio.com/docs/java/install
import com.twilio.Twilio;
import com.twilio.rest.api.v2010.account.sip.domain.IpAccessControlListMapping;

public class Example {
  /// Find your Account Sid and Token at twilio.com/user/account
  public static final String ACCOUNT_SID = "ACXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX";
  public static final String AUTH_TOKEN = "your_auth_token";

  public static void main(String[] args) {
    Twilio.init(ACCOUNT_SID, AUTH_TOKEN);

    IpAccessControlListMapping ipAccessControlListMapping = IpAccessControlListMapping
        .create("SD32a3c49700934481addd5ce1659f04d2", "AL95a47094615fe05b7c17e62a7877836c")
        .execute();

    System.out.println(ipAccessControlListMapping.getSid());
  }
}
