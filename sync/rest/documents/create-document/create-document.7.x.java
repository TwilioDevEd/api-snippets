// Install the Java helper library from twilio.com/docs/java/install
import java.util.HashMap;
import java.util.Map;

import com.twilio.Twilio;
import com.twilio.rest.preview.sync.service.Document;

public class Example {
  // Find your Account Sid and Token at twilio.com/user/account
  public static final String ACCOUNT_SID = "ACXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX";
  public static final String AUTH_TOKEN = "your_auth_token";

  public static void main(String[] args) {
    Twilio.init(ACCOUNT_SID, AUTH_TOKEN);

    Map<String, Object> data = new HashMap<>();

    String[] showTimes = {"12:30:00Z", "14:45:00Z", "15:30:00Z", "17:45:00Z", "20:30:00Z"};
    String[] starring = {"Lance Bass", "Joey Fatone"};

    data.put("dateUpdated", "2016-07-06T12:46:38Z");
    data.put("movieTitle", "On The Line");
    data.put("showTimes", showTimes);
    data.put("starring", starring);
    data.put("genre", "romance");

    Document document = Document
        .creator("ISXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX")
        .setUniqueName("MyFirstDocument")
        .setData(data)
        .create();

    System.out.println(document.getSid());
  }
}
