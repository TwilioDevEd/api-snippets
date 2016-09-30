// Install the Java helper library from twilio.com/docs/java/install
import org.joda.time.DateTime;

import com.twilio.Twilio;
import com.twilio.base.ResourceSet;
import com.twilio.rest.monitor.v1.Alert;

public class Example {
  // Find your Account Sid and Token at twilio.com/user/account
  public static final String ACCOUNT_SID = "ACXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX";
  public static final String AUTH_TOKEN = "your_auth_token";

  public static void main(String[] args) {
    Twilio.init(ACCOUNT_SID, AUTH_TOKEN);

    ResourceSet<Alert> alerts = Alert.reader()
        .byStartDate(DateTime.parse("2015-04-01T00:00:00Z"))
        .byEndDate(DateTime.parse("2015-04-30T23:59:59Z"))
        .byLogLevel("warning")
        .read();

    // Loop over alerts and print out a property for each one.
    for (Alert alert : alerts) {
      System.out.println(alert.getAlertText());
    }
  }
}
