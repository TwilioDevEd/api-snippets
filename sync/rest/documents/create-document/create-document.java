import com.twilio.sdk.Twilio;
import com.twilio.sdk.resource.preview.sync.service.Document;
import java.util.HashMap;

public class Example {

  // Find your Account Sid and Token at twilio.com/console
  public static final String ACCOUNT_SID = "ACXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX";
  public static final String AUTH_TOKEN = "your_auth_token";

  public static void main(String[] args) {
    Twilio.init(ACCOUNT_SID, AUTH_TOKEN);

    HashMap<String, Object> data = new HashMap<>();
    data.put("DateUpdated", null);
    data.put("MovieTitle", "On The Line");
    data.put("ShowTimes", new String[]
        {"12:30:00Z", "14:45:00Z", "15:30:00Z", "17:45:00Z", "20:30:00Z"});
    data.put("Starring", new String[] {"Lance Bass", "Joey Fatone"});
    data.put("Genre", "Romance");

    Document doc = Document.create("ISXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX")
      .setUniqueName("MyFirstDocument")
      .setData(data)
      .execute();

    System.out.println(doc.getSid());
  }
}