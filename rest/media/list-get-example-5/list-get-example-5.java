// Install the Java helper library from twilio.com/docs/java/install
import com.twilio.sdk.TwilioRestClient;
import com.twilio.sdk.TwilioRestException;
import com.twilio.sdk.resource.instance.Media;
import com.twilio.sdk.resource.list.MediaList;
import java.util.HashMap;
import java.util.Map;

public class Example { 

  // Find your Account Sid and Token at twilio.com/user/account
  public static final String ACCOUNT_SID = "ACXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX";
  public static final String AUTH_TOKEN = "{{ auth_token }}";

  public static void main(String[] args) throws TwilioRestException {
    TwilioRestClient client = new TwilioRestClient(ACCOUNT_SID, AUTH_TOKEN);

    // Build a filter for the MediaList
    Map<String, String> params = new HashMap<String, String>();
    
    params.put("DateCreated>", "2013-01-01");
    
    MediaList medias = client.getAccount().getMedia(params);
    
    // Loop over medias and print out a property for each one.
    for (Media media : medias) {
      System.out.println(media.getParentSid());
    }
    
  }
}