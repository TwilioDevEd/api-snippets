// Install the Java helper library from twilio.com/docs/java/install
import com.twilio.rest.Twilio;
import com.twilio.rest.resource.ResourceSet;
import com.twilio.rest.resource.api.v2010.account.message.Media;

public class Example {
  // Find your Account Sid and Token at twilio.com/user/account
  public static final String ACCOUNT_SID = "ACXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX";
  public static final String AUTH_TOKEN = "your_auth_token";

  public static void main(String[] args) {
    Twilio.init(ACCOUNT_SID, AUTH_TOKEN);

    ResourceSet<Media> allMedia = Media.read("MM800f449d0399ed014aae2bcc0cc2f2ec").execute();

    // Loop over media and print out a property for each one.
    for (Media media : allMedia) {
      System.out.println(media.getContentType());
    }
  }
}
