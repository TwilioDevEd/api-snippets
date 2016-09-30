// Install the Java helper library from twilio.com/docs/java/install
import com.twilio.Twilio;
import com.twilio.rest.api.v2010.account.IncomingPhoneNumber;

public class Example {
  // Find your Account Sid and Token at twilio.com/user/account
  public static final String ACCOUNT_SID = "ACXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX";
  public static final String AUTH_TOKEN = "your_auth_token";

  public static void main(String[] args) {
    Twilio.init(ACCOUNT_SID, AUTH_TOKEN);

    String firstSubAccountSid = "ACXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX";
    String secondSubAccountSid = "ACXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX";

    IncomingPhoneNumber number = IncomingPhoneNumber
        .update(firstSubAccountSid, "PN2a0747eba6abf96b7e3c3ff0b4530f6e")
        .setAccountSid(secondSubAccountSid)
        .execute();

    System.out.println(number.getDateUpdated());
  }
}
