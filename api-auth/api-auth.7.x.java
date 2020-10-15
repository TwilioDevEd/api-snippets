import com.twilio.Twilio;
import com.twilio.base.ResourceSet;
import com.twilio.rest.api.v2010.Account;

public class Example {
    // Find your Account Sid at twilio.com/account
    // To set up environment variables, see http://twil.io/secure
    public static final String ACCOUNT_SID = System.getenv("TWILIO_ACCOUNT_SID");
    // You can generate these from www.twilio.com/console/runtime/api-keys/create
    public static final String API_KEY = System.getenv("TWILIO_API_KEY");
    public static final String API_SECRET = System.getenv("TWILIO_API_SECRET");

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
