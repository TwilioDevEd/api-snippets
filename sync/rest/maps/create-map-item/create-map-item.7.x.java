// Install the Java helper library from twilio.com/docs/java/install
import java.util.HashMap;
import java.util.Map;

import com.twilio.Twilio;
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


    Map<String, Object> data = new HashMap<>();
    data.put("name", "Stephen Curry");
    data.put("level", 30);
    data.put("username", "'spicy_curry'");

    // Create a Map Item
    SyncMapItem item = SyncMapItem.creator(SERVICE_SID, MAP_SID, "steph_curry", data)
                                  .setTtl(864000) // expires in 10 days
                                  .create();

    System.out.println(item.getUrl());
  }
}
