// You may want to be more specific in your imports
import java.util.*;
import com.twilio.sdk.*;
import com.twilio.sdk.resource.factory.*;
import com.twilio.sdk.resource.instance.*;
import com.twilio.sdk.resource.list.*;
import java.util.ArrayList;
import java.util.List;
import org.apache.http.NameValuePair;
import org.apache.http.message.BasicNameValuePair;

public class TwilioTest {
 // Find your Account Sid and Token at twilio.com/user/account
 public static final String ACCOUNT_SID = "{{#accountSid}}{{accountSid}}{{/accountSid}}";
 public static final String AUTH_TOKEN = "{{#authToken}}{{authToken}}{{/authToken}}";

 public static void main(String[]args) throws TwilioRestException {
  TwilioRestClient client = new TwilioRestClient(ACCOUNT_SID, AUTH_TOKEN);

   // Build the parameters
   List<NameValuePair> params = new ArrayList<NameValuePair>();
   params.add(new BasicNameValuePair("To", "{{#toPhoneNumber}}{{toPhoneNumber}}{{/toPhoneNumber}}"));
   params.add(new BasicNameValuePair("From", "{{#fromPhoneNumber}}{{fromPhoneNumber}}{{/fromPhoneNumber}}"));
   params.add(new BasicNameValuePair("Body", "{{#messageBody}}{{messageBody}}{{/messageBody}}"));
   params.add(new BasicNameValuePair("MediaUrl", "{{#messageMediaUrl}}{{messageMediaUrl}}{{/messageMediaUrl}}"));

   MessageFactory messageFactory = client.getAccount().getMessageFactory();
   Message message = messageFactory.create(params);
   System.out.println(message.getSid());
 }
}
