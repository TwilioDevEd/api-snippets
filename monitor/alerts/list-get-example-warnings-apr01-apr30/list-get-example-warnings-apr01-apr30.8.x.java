// Install the Java helper library from twilio.com/docs/java/install
import com.twilio.Twilio;
import com.twilio.base.ResourceSet;
import com.twilio.rest.monitor.v1.Alert;

import java.time.LocalDate;

public class Example {
  // Find your Account Sid and Token at twilio.com/user/account
  public static final String ACCOUNT_SID = "ACXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX";
  public static final String AUTH_TOKEN = "your_auth_token";

  public static void main(String[] args) {
    Twilio.init(ACCOUNT_SID, AUTH_TOKEN);

    ResourceSet<Alert> alerts = Alert.reader()
        .setStartDate(LocalDate.of(2015, 4, 1))
        .setEndDate(LocalDate.of(2015, 4, 30))
        .setLogLevel("warning")
        .read();

    // Loop over alerts and print out a property for each one.
    for (Alert alert : alerts) {
      System.out.println(alert.getAlertText());
    }
  }
}
