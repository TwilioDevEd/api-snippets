// Install the Java helper library from twilio.com/docs/java/install
import com.twilio.sdk.TwilioRestClient;
import com.twilio.sdk.TwilioRestException;
import com.twilio.sdk.resource.instance.Notification;
import com.twilio.sdk.resource.list.NotificationList;
import java.util.HashMap;
import java.util.Map;

public class Example { 

  // Find your Account Sid and Token at twilio.com/user/account
  public static final String ACCOUNT_SID = "ACXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX";
  public static final String AUTH_TOKEN = "your_auth_token";

  public static void main(String[] args) throws TwilioRestException {
    TwilioRestClient client = new TwilioRestClient(ACCOUNT_SID, AUTH_TOKEN);

    // Build a filter for the NotificationList
    Map<String, String> params = new HashMap<String, String>();
    
    params.put("MessageDate>", "2009-07-06");
    params.put("MessageDate<", "2009-07-08");
    params.put("Log", "1");
    
    NotificationList notifications = client.getAccount().getNotifications(params);
    
    // Loop over notifications and print out a property for each one.
    for (Notification notification : notifications) {
      System.out.println(notification.getRequestUrl());
    }
    
  }
}