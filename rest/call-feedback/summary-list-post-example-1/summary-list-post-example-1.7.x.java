// Install the Java helper library from twilio.com/docs/java/install
import org.joda.time.LocalDate;

import com.twilio.Twilio;
import com.twilio.rest.api.v2010.account.call.FeedbackSummary;

public class Example {
  // Find your Account Sid and Token at twilio.com/user/account
  public static final String ACCOUNT_SID = "ACXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX";
  public static final String AUTH_TOKEN = "your_auth_token";

  public static void main(String[] args) {
    Twilio.init(ACCOUNT_SID, AUTH_TOKEN);

    FeedbackSummary summary = FeedbackSummary
        .creator(LocalDate.parse("2014-06-01"), LocalDate.parse("2014-06-30"))
        .setIncludeSubaccounts(true).setStatusCallback("http://www.example.com/feedback").create();

    System.out.println(summary.getStatus());
  }
}
