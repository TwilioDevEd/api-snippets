// You may want to be more specific in your imports 
import java.util.*; 
import com.twilio.sdk.*; 
import com.twilio.sdk.resource.factory.*; 
import com.twilio.sdk.resource.instance.*; 
import com.twilio.sdk.resource.list.*; 
 
public class TwilioTest { 
  // Find your Account Sid and Token at twilio.com/user/account 
  public static final String ACCOUNT_SID = "ACXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX"; 
  public static final String AUTH_TOKEN = "[AuthToken]"; 

  public static void main(String[]args) throws TwilioRestException { 
    TwilioRestClient client = new TwilioRestClient(ACCOUNT_SID, AUTH_TOKEN); 

    // Build the parameters 
    List<NameValuePair> params = new ArrayList<NameValuePair>(); 
    params.add(new BasicNameValuePair("To", "+16518675309")); 
    params.add(new BasicNameValuePair("MessagingServiceSid", "MG9752274e9e519418a7406176694466fa")); 
    params.add(new BasicNameValuePair("Body", 
      "Phantom Menace was clearly the best of the prequel trilogy."));

    MessageFactory messageFactory = client.getAccount().getMessageFactory(); 
    Message message = messageFactory.create(params); 
    System.out.println(message.getSid()); 
  } 
}