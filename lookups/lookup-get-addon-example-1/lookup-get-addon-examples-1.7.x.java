// Install the Java helper library from twilio.com/docs/libraries/java
import com.twilio.Twilio;
import com.twilio.rest.lookups.v1.PhoneNumber;

public class Example {
  // Find your Account Sid and Token at twilio.com/user/account
  public static final String ACCOUNT_SID = "ACXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX";
  public static final String AUTH_TOKEN = "your_auth_token";

  public static void main(String[] args) {
    Twilio.init(ACCOUNT_SID, AUTH_TOKEN);

    PhoneNumber number = PhoneNumber
        .fetcher(new com.twilio.type.PhoneNumber("+16502530000"))
        .setAddOns("whitepages_pro_caller_id")
        .fetch();

    System.out.println(number.getCallerName());
  }
}
