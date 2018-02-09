// Install the Java helper library from twilio.com/docs/java/install
import java.util.HashMap;
import java.util.Map;

import com.twilio.Twilio;
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

    Map<String, Object> data = new HashMap<>();
    data.put("number", "001");
    data.put("name", "'Bulbasaur");
    data.put("attack", 49);

    SyncListItem item = SyncListItem.updater(SERVICE_SID, LIST_SID, 0)
                                    .setData(data)
                                    .update();

    System.out.println(item.getData());
  }
}
