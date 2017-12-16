// Install the Java helper library from twilio.com/docs/java/install
import com.twilio.Twilio;
import com.twilio.rest.api.v2010.account.Address;

public class Example {
  // Find your Account Sid and Token at twilio.com/user/account
    public static final String ACCOUNT_SID = "ACXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX";
    public static final String AUTH_TOKEN = "your_auth_token";

    public static void main(String[] args) {
        Twilio.init(ACCOUNT_SID, AUTH_TOKEN);

        // Get an object from its sid. If you do not have a sid,
        // check out the list resource examples on this page
        Address address = Address.creator(
            "Customer 500",
            "Elm Street",
            "Racoon",
            "Mordor",
            "150",
            "AX"
        ).create();

        System.out.println(address.getCustomerName());
    }
}
