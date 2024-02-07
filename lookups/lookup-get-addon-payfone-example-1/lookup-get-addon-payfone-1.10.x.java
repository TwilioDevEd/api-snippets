// Install the Java helper library from twilio.com/docs/java/install
import java.util.HashMap;
import java.util.Map;

import com.twilio.Twilio;
import com.twilio.rest.lookups.v1.PhoneNumber;

public class Example {
  // Get your Account SID and Auth Token from https://twilio.com/console
  // To set up environment variables, see http://twil.io/secure
  public static final String ACCOUNT_SID = System.getenv("TWILIO_ACCOUNT_SID");
  public static final String AUTH_TOKEN = System.getenv("TWILIO_AUTH_TOKEN");

  public static void main(String[] args) {
    Twilio.init(ACCOUNT_SID, AUTH_TOKEN);


    Map<String, Object> complianceData = new HashMap<>();
    complianceData.put("RightPartyContactedDate", "20160101");

    Map<String, Object> addOnData = new HashMap<>();
    addOnData.put("payfone_tcpa_compliance", complianceData);

    PhoneNumber number = PhoneNumber
        .fetcher(new com.twilio.type.PhoneNumber("+15108675310"))
        .setType("carrier")
        .setAddOns("payfone_tcpa_compliance")
        .setAddOnsData(addOnData)
        .fetch();

    System.out.println(number.getCarrier());
  }
}
