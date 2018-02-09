// Install the Java helper library from twilio.com/docs/java/install
import java.util.HashMap;
import java.util.Map;

import com.twilio.Twilio;
import com.twilio.rest.sync.v1.service.Document;

public class Example {
  // Find your Account Sid and Token at twilio.com/user/account
  public static final String ACCOUNT_SID = "ACXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX";
  public static final String AUTH_TOKEN = "your_auth_token";

  public static final String SERVICE_SID = "ISXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX";

  public static void main(String[] args) {
    Twilio.init(ACCOUNT_SID, AUTH_TOKEN);

    Map<String, Object> data = new HashMap<>();

    String[] starring = {"Lance Bass", "Joey Fatone"};

    data.put("dateUpdated", "2016-07-06T12:46:38Z");
    data.put("movieTitle", "On The Line");
    data.put("starring", starring);
    data.put("genre", "Romance");

    Document document = Document.updater(SERVICE_SID, "MyFirstDocument")
                                .setData(data)
                                .update();

    System.out.println(document.getData());
  }
}
