// Install the Java helper library from twilio.com/docs/java/install
import com.twilio.sdk.TwilioRestClient;
import com.twilio.sdk.TwilioRestException;
import com.twilio.sdk.resource.instance.Media;
import com.twilio.sdk.resource.list.MediaList;

public class Example { 

  // Find your Account Sid and Token at twilio.com/user/account
  public static final String ACCOUNT_SID = "ACXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX";
  public static final String AUTH_TOKEN = "your_auth_token";

  public static void main(String[] args) throws TwilioRestException {
    TwilioRestClient client = new TwilioRestClient(ACCOUNT_SID, AUTH_TOKEN);
 
    MediaList medias = client.getAccount().getMessage("MM800f449d0399ed014aae2bcc0cc2f2ec").getMedia();
    
    // Loop over medias and print out a property for each one.
    for (Media media : medias) {
      System.out.println(media.getContentType());
    }
    
  }
}