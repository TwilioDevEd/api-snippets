import com.twilio.Twilio;
import com.twilio.http.HttpMethod;
import com.twilio.rest.wireless.v1.Sim;

public class Example {
    // Get your Account SID and Auth Token from https://twilio.com/console
    // To set up environment variables, see http://twil.io/secure
    public static final String ACCOUNT_SID = System.getenv("TWILIO_ACCOUNT_SID");
    public static final String AUTH_TOKEN = System.getenv("TWILIO_AUTH_TOKEN");

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
