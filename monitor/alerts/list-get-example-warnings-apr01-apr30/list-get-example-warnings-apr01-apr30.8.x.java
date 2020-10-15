// Install the Java helper library from twilio.com/docs/java/install
import com.twilio.Twilio;
import com.twilio.base.ResourceSet;
import com.twilio.rest.monitor.v1.Alert;

import java.time.LocalDate;

public class Example {
  // Get your Account SID and Auth Token from https://twilio.com/console
  // To set up environment variables, see http://twil.io/secure
  public static final String ACCOUNT_SID = System.getenv("TWILIO_ACCOUNT_SID");
  public static final String AUTH_TOKEN = System.getenv("TWILIO_AUTH_TOKEN");

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
