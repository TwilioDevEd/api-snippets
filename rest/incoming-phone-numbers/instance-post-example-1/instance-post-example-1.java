// Install the Java helper library from twilio.com/docs/java/install
import com.twilio.sdk.TwilioRestClient;
import com.twilio.sdk.TwilioRestException;
import com.twilio.sdk.resource.instance.IncomingPhoneNumber;
import com.twilio.sdk.resource.list.IncomingPhoneNumberList;
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

    // Get an object from its sid. If you do not have a sid,
    // check out the list resource examples on this page
    IncomingPhoneNumber number = client.getAccount().getIncomingPhoneNumber("PN2a0747eba6abf96b7e3c3ff0b4530f6e");
    // Build a filter for the IncomingPhoneNumberList
    List<NameValuePair> params = new ArrayList<NameValuePair>();
    params.add(new BasicNameValuePair("VoiceUrl", "http://demo.twilio.com/docs/voice.xml"));
    params.add(new BasicNameValuePair("SmsUrl", "http://demo.twilio.com/docs/sms.xml"));
    number.update(params); 
  }
}