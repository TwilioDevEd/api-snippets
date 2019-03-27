import com.twilio.Twilio;
import com.twilio.base.ResourceSet;
import com.twilio.rest.api.v2010.Account;

public class Example {
    // Find your Account Sid and Token at twilio.com/user/account
    public static final String ACCOUNT_SID = "ACXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX";
    public static final String API_KEY = "SKXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX";
    public static final String API_SECRET = "your_api_secret";

    public static void main(String[] args) {
        Twilio.init(API_KEY, API_SECRET, ACCOUNT_SID);

        // Proof request to check credentials are working.
        // Retrieving your account information
        ResourceSet<Account> accounts = Account.reader().read();

        for(Account record : accounts) {
            System.out.println(record.getSid());
        }
    }
}
