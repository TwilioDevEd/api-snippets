import com.twilio.Twilio;
import com.twilio.http.HttpMethod;
import com.twilio.rest.wireless.v1.Sim;

public class Example {
    // Find your Account Sid and Token at twilio.com/console
    public static final String ACCOUNT_SID = "ACXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX";
    public static final String AUTH_TOKEN = "your_auth_token";

    public static void main(String[] args) {
        // Initialize the client
        Twilio.init(ACCOUNT_SID, AUTH_TOKEN);

        Sim sim = Sim.updater("DEAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAA")
                .setCallbackMethod(HttpMethod.POST)
                .setCallbackUrl("https://sim-manager.mycompany.com/sim-update-callback/AliceSmithSmartMeter")
                .setStatus(Sim.Status.ACTIVE)
                .update();

        System.out.println(sim);
    }
}
