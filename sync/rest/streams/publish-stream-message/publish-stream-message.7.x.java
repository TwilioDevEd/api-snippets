// Install the Java helper library from twilio.com/docs/java/install
import java.util.HashMap;
import java.util.Map;

import com.twilio.Twilio;
import com.twilio.rest.sync.v1.service.syncstream.StreamMessage;

public class Example {
  // Find your Account Sid and Token at twilio.com/user/account
  public static final String ACCOUNT_SID = "ACXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX";
  public static final String AUTH_TOKEN = "your_auth_token";

  public static final String SERVICE_SID = "ISXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX";
  // You can use a Stream SID or unique name
  public static final String STREAM_ID = "MyStream";

  public static void main(String[] args) {
    Twilio.init(ACCOUNT_SID, AUTH_TOKEN);

    Map<String, Object> data = new HashMap<>();
    data.put("id", "bob");
    data.put("x", 256);
    data.put("y", 42);

    StreamMessage message = StreamMessage.creator(SERVICE_SID, STREAM_ID, data).create();

    System.out.println(message.getSid());
  }
}
