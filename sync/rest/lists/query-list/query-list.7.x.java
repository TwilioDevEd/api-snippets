// Install the Java helper library from twilio.com/docs/java/install
import com.twilio.Twilio;
import com.twilio.base.ResourceSet;
import com.twilio.rest.sync.v1.service.synclist.SyncListItem;

public class Example {
  // Find your Account Sid and Token at twilio.com/user/account
  public static final String ACCOUNT_SID = "ACXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX";
  public static final String AUTH_TOKEN = "your_auth_token";

  public static final String SERVICE_SID = "ISXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX";
  // You can use a list SID or unique name
  public static final String LIST_SID = "UniqueName";

  public static void main(String[] args) {
    Twilio.init(ACCOUNT_SID, AUTH_TOKEN);

    ResourceSet<SyncListItem> items = SyncListItem
        .reader(SERVICE_SID, LIST_SID)
        .setFrom("10")
        .setOrder(SyncListItem.QueryResultOrder.ASC)
        .read();

    for (SyncListItem item : items) {
      System.out.println(item.getData());
    }
  }
}
