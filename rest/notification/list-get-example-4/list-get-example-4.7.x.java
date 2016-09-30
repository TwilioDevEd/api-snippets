// Install the Java helper library from twilio.com/docs/java/install
import org.joda.time.DateTime;

import com.google.common.collect.Range;
import com.twilio.Twilio;
import com.twilio.base.ResourceSet;
import com.twilio.rest.api.v2010.account.Notification;

public class Example {
  /// Find your Account Sid and Token at twilio.com/user/account
  public static final String ACCOUNT_SID = "ACXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX";
  public static final String AUTH_TOKEN = "your_auth_token";

  public static void main(String[] args) {
    Twilio.init(ACCOUNT_SID, AUTH_TOKEN);

    DateTime lower = DateTime.parse("2009-07-06");
    DateTime higher = DateTime.parse("2009-07-08");

    ResourceSet<Notification> notifications = Notification.reader()
        .byMessageDate(Range.closed(lower, higher))
        .byLog(1)
        .read();

    // Loop over notifications and print out a property for each one.
    for (Notification notification : notifications) {
      System.out.println(notification.getRequestUrl());
    }
  }
}
