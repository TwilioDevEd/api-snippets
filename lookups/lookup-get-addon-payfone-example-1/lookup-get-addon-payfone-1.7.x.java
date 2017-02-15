// Install the Java helper library from twilio.com/docs/java/install
import java.util.HashMap;
import java.util.Map;

import com.twilio.Twilio;
import com.twilio.rest.lookups.v1.PhoneNumber;

public class Example {
  // Find your Account Sid and Token at twilio.com/user/account
  public static final String ACCOUNT_SID = "ACXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX";
  public static final String AUTH_TOKEN = "your_auth_token";

  public static void main(String[] args) {
    Twilio.init(ACCOUNT_SID, AUTH_TOKEN);


    Map<String, Object> complianceData = new HashMap<>();
    complianceData.put("RightPartyContactedDate", "20160101");

    Map<String, Object> addOnData = new HashMap<>();
    addOnData.put("payfone_tcpa_compliance", complianceData);

    PhoneNumber number = PhoneNumber
        .fetcher(new com.twilio.type.PhoneNumber("+15108675309"))
        .setType("carrier")
        .setAddOns("payfone_tcpa_compliance")
        .setAddOnsData(addOnData)
        .fetch();

    System.out.println(number.getCarrier());
  }
}
