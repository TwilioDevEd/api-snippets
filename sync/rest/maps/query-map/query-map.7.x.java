// Install the Java helper library from twilio.com/docs/java/install
import com.twilio.Twilio;
import com.twilio.base.ResourceSet;
import com.twilio.rest.sync.v1.service.syncmap.SyncMapItem;

public class Example {
  // Find your Account Sid and Token at twilio.com/user/account
  public static final String ACCOUNT_SID = "ACXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX";
  public static final String AUTH_TOKEN = "your_auth_token";

  public static final String SERVICE_SID = "ISXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX";
  // You can use a map SID or unique name
  public static final String MAP_SID = "Players";

  public static void main(String[] args) {
    Twilio.init(ACCOUNT_SID, AUTH_TOKEN);

    ResourceSet<SyncMapItem> items = SyncMapItem
        .reader(SERVICE_SID, MAP_SID)
        .setFrom("steph_curry")
        .setOrder(SyncMapItem.QueryResultOrder.ASC)
        .read();

    for (SyncMapItem item : items) {
      System.out.println(item.getSid() + ": " + item.getData());
    }
  }
}
