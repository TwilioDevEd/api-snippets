// Install the Java helper library from twilio.com/docs/java/install
import org.joda.time.DateTime;

import com.twilio.rest.Twilio;
import com.twilio.rest.resource.ResourceSet;
import com.twilio.rest.resource.api.v2010.account.Call;

public class Example {
  // Find your Account Sid and Token at twilio.com/user/account
  public static final String ACCOUNT_SID = "ACXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX";
  public static final String AUTH_TOKEN = "your_auth_token";

  public static void main(String[] args) {
    Twilio.init(ACCOUNT_SID, AUTH_TOKEN);

    DateTime dateTime = DateTime.parse("2009-07-06");

    ResourceSet<Call> calls =
        Call.read().byStatus(Call.Status.COMPLETED).byStartTime(dateTime).execute();

    // Loop over calls and print out a property for each one.
    for (Call call : calls) {
      System.out.println(call.getDirection());
    }
  }
}
