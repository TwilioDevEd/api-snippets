import com.twilio.Twilio;
import com.twilio.rest.wireless.v1.RatePlan;

public class Example {
    // Find your Account Sid and Token at twilio.com/console
    public static final String ACCOUNT_SID = "ACXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX";
    public static final String AUTH_TOKEN = "your_auth_token";

    public static void main(String[] args) {
        // Initialize the client
        Twilio.init(ACCOUNT_SID, AUTH_TOKEN);

        RatePlan ratePlan = RatePlan.creator().setUniqueName("SmartMeterCA")
                .setFriendlyName("California SmartMeter Plan")
                .setDataLimit(5)
                .setMessagingEnabled(true)
                .create();

        System.out.println(ratePlan);
    }
}
