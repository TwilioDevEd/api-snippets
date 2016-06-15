// Download the **Next-Gen** twilio-java library from:
// twilio.com/docs/libraries/java#installation-nextgen
import com.twilio.sdk.Twilio;
import com.twilio.sdk.resource.preview.wireless.device.Usage;

public class Example {

  // Find your Account Sid and Token at twilio.com/console
  public static final String ACCOUNT_SID = "ACXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX";
  public static final String AUTH_TOKEN = "your_auth_token";

  public static void main(String[] args) {
    Twilio.init(ACCOUNT_SID, AUTH_TOKEN);

    Usage usage = Usage.fetch("524116518656369")
      .setStart("2016-05-01")
      .setEnd("2016-05-31")
      .execute();
    System.out.println(usage.getPeriod().get("start"));
    System.out.println(usage.getPeriod().get("end"));
    System.out.println(usage.getDataCosts().get("total"));
  }
}