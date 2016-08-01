// Install the Java helper library from twilio.com/docs/java/install
import com.twilio.rest.Twilio;
import com.twilio.rest.fetcher.api.v2010.account.AddressFetcher;
import com.twilio.rest.resource.api.v2010.account.Address;

public class Example {
  // Find your Account Sid and Token at twilio.com/user/account
  public static final String ACCOUNT_SID = "ACXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX";
  public static final String AUTH_TOKEN = "your_auth_token";

  public static void main(String[] args) {
    Twilio.init(ACCOUNT_SID, AUTH_TOKEN);

    // Get an object from its sid. If you do not have a sid,
    // check out the list resource examples on this page
    Address address = new AddressFetcher("AD2a0747eba6abf96b7e3c3ff0b4530f6e").execute();

    System.out.println(address.getCustomerName());
  }
}
