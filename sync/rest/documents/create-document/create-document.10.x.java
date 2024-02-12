// Install the Java helper library from twilio.com/docs/java/install
import java.util.HashMap;
import java.util.Map;

import com.twilio.Twilio;
import com.twilio.rest.sync.v1.service.Document;

public class Example {
  // Get your Account SID and Auth Token from https://twilio.com/console
  // To set up environment variables, see http://twil.io/secure
  public static final String ACCOUNT_SID = System.getenv("TWILIO_ACCOUNT_SID");
  public static final String AUTH_TOKEN = System.getenv("TWILIO_AUTH_TOKEN");

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
        .setTtl(1814400) // expires in 21 days
        .create();

    System.out.println(document.getSid());
  }
}
