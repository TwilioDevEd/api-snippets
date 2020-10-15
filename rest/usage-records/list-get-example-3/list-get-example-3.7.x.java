// Install the Java helper library from twilio.com/docs/java/install
import org.joda.time.LocalDate;

import com.twilio.Twilio;
import com.twilio.base.ResourceSet;
import com.twilio.rest.api.v2010.account.usage.Record;

public class Example {
  // Get your Account SID and Auth Token from https://twilio.com/console
  // To set up environment variables, see http://twil.io/secure
  public static final String ACCOUNT_SID = System.getenv("TWILIO_ACCOUNT_SID");
  public static final String AUTH_TOKEN = System.getenv("TWILIO_AUTH_TOKEN");

  public static void main(String[] args) {
    Twilio.init(ACCOUNT_SID, AUTH_TOKEN);

    ResourceSet<Record> records = Record.reader()
        .setCategory(Record.Category.CALLS_INBOUND)
        .setStartDate(LocalDate.parse("2012-09-01"))
        .setEndDate(LocalDate.parse("2012-09-30"))
        .read();

    // Loop over records and print out a property for each one.
    for (Record record : records) {
      System.out.println(record.getPrice());
    }
  }
}
