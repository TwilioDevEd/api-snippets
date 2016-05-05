// Install the Java helper library from twilio.com/docs/java/install
import com.twilio.sdk.TwilioRestClient;
import com.twilio.sdk.TwilioRestException;
import com.twilio.sdk.resource.instance.UsageRecord;
import com.twilio.sdk.resource.list.UsageRecordList;
import com.twilio.sdk.resource.list.UsageRecordList.Type;
import java.util.HashMap;
import java.util.Map;

public class Example { 

  // Find your Account Sid and Token at twilio.com/user/account
  public static final String ACCOUNT_SID = "ACXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX";
  public static final String AUTH_TOKEN = "{{ auth_token }}";

  public static void main(String[] args) throws TwilioRestException {
    TwilioRestClient client = new TwilioRestClient(ACCOUNT_SID, AUTH_TOKEN);

    // Build a filter for the UsageRecordsTodayList
    Map<String, String> params = new HashMap<String, String>();
    
    params.put("Category", "calls");
    
    UsageRecordList records = client.getAccount().getUsageRecords(params, Type.TODAY);
    
    // Loop over records and print out a property for each one.
    for (UsageRecord record : records) {
      System.out.println(record.getCount());
    }
    
  }
}