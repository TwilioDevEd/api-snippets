// Install the Java helper library from twilio.com/docs/java/install
import com.twilio.Twilio;
import com.twilio.rest.api.v2010.account.IncomingPhoneNumber;

public class Example {
  // Find your Account Sid and Token at twilio.com/user/account
  public static final String ACCOUNT_SID = "ACXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX";
  public static final String AUTH_TOKEN = "your_auth_token";

  // In the case you want to transfer numbers between subaccounts, you need to 
  // know three things - the account SID of the phone number's current owner, 
  // the account SID of the account you'd like to transfer the number to, and 
  // the SID of the phone number you'd like to transfer
  public static final String CURRENT_OWNER_SID = "ACyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyy";
  public static final String NEW_OWNER_SID = "ACzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzz";
  public static final String NUMBER_SID = "PNyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyy";

  public static void main(String[] args) {
    Twilio.init(ACCOUNT_SID, AUTH_TOKEN);

    IncomingPhoneNumber number = IncomingPhoneNumber
        .updater(CURRENT_OWNER_SID, NUMBER_SID)
        .setAccountSid(NEW_OWNER_SID)
        .update();

    System.out.println(number.getDateUpdated());
  }
}
