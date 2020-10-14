// Install the Java helper library from twilio.com/docs/java/install
import com.twilio.Twilio;
import com.twilio.base.ResourceSet;
import com.twilio.rest.api.v2010.account.usage.record.Daily;

import java.time.LocalDate;

public class Example {
    // Find your Account Sid and Token at twilio.com/user/account
    public static final String ACCOUNT_SID = "ACXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX";
    public static final String AUTH_TOKEN = "your_auth_token";

    public static void main(String[] args) {
        Twilio.init(ACCOUNT_SID, AUTH_TOKEN);

        ResourceSet<Daily> records = Daily.reader()
                .setCategory(Daily.Category.CALLS_INBOUND)
                .setStartDate(LocalDate.of(2012, 9, 1))
                .setEndDate(LocalDate.of(2012, 9, 30))
                .read();

        // Loop over records and print out a property for each one.
        for (Daily record : records) {
            System.out.println(record.getPrice());
        }
    }
}
