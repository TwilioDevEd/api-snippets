// Install the Java helper library from twilio.com/docs/java/install
import org.joda.time.DateTime;

import com.twilio.Twilio;
import com.twilio.base.ResourceSet;
import com.twilio.rest.monitor.v1.Event;

public class Example {
  /// Find your Account Sid and Token at twilio.com/user/account
  public static final String ACCOUNT_SID = "ACXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX";
  public static final String AUTH_TOKEN = "your_auth_token";

  public static void main(String[] args) {
    Twilio.init(ACCOUNT_SID, AUTH_TOKEN);

    ResourceSet<Event> events = Event.read()
        .bySourceIpAddress("104.14.155.29")
        .byStartDate(DateTime.parse("2015-04-25T00:00:00Z"))
        .byEndDate(DateTime.parse("2015-04-25T23:59:59Z"))
        .execute();

    for (Event e : events) {
      System.out.println(e.getDescription());
    }
  }
}
