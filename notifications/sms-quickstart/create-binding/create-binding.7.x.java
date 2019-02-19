// Install the Java helper library from twilio.com/docs/java/install
import com.twilio.Twilio;
import com.twilio.rest.notify.service.Binding;

public class Example {
  // Find your Account Sid and Token at twilio.com/user/account
  public static final String ACCOUNT_SID = "ACCOUNT_SID";
  public static final String AUTH_TOKEN = "AUTH_TOKEN";

  public static final String SERVICE_SID = "ISXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX";

  public static void main(String[] args) {
    // Initialize the client
    Twilio.init(ACCOUNT_SID, AUTH_TOKEN);

    Binding binding = Binding.creator
    (
      SERVICE_SID,
      "00000001", // We recommend using a GUID or other anonymized identifier for Identity.
      Binding.BindingType.SMS,
      "+1651000000000"
    ).create();

    System.out.println(binding.getSid());
  }
}
