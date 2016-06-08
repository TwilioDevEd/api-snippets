// Install the Java helper library from twilio.com/docs/java/install
import com.twilio.sdk.TwilioRestClient;
import com.twilio.sdk.TwilioRestException;
import com.twilio.sdk.resource.factory.SmsFactory;
import com.twilio.sdk.resource.instance.Sms;
import com.twilio.sdk.resource.list.SmsList;
import java.util.ArrayList;
import java.util.List;
import org.apache.http.NameValuePair;
import org.apache.http.message.BasicNameValuePair;

public class Example { 

  // Find your Account Sid and Token at twilio.com/user/account
  public static final String ACCOUNT_SID = "{{ account_sid }}";
  public static final String AUTH_TOKEN = "{{ auth_token }}";

  public static void main(String[] args) throws TwilioRestException {
    TwilioRestClient client = new TwilioRestClient(ACCOUNT_SID, AUTH_TOKEN);

    // Build a filter for the SmsList
    List<NameValuePair> params = new ArrayList<NameValuePair>();
    params.add(new BasicNameValuePair("Body", "Hey Mr Nugget, you the bomb!"));
    params.add(new BasicNameValuePair("To", "+15005550009"));
    params.add(new BasicNameValuePair("From", "+15005550006"));
    
    
    SmsFactory smsFactory = client.getAccount().getSmsFactory();
    Sms sms = smsFactory.create(params);
    System.out.println(sms.getSid());
  }
}