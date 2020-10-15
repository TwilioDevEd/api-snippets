// NOTE: This example uses the next generation Twilio helper library - for more
// information on how to download and install this version, visit
// https://www.twilio.com/docs/libraries/java
import com.twilio.Twilio;
import com.twilio.rest.notify.v1.service.user.SegmentMembership;

public class Example {
    // Get your Account SID and Auth Token from https://twilio.com/console
    // To set up environment variables, see http://twil.io/secure
    public static final String ACCOUNT_SID = System.getenv("TWILIO_ACCOUNT_SID");
    public static final String AUTH_TOKEN = System.getenv("TWILIO_AUTH_TOKEN");

    public static final String SERVICE_SID = System.getenv("TWILIO_SERVICE_SID");

    public static void main(String[] args) {
        // Initialize the client
        Twilio.init(ACCOUNT_SID, AUTH_TOKEN);

        // Create segment membership
        SegmentMembership segmentMembership = SegmentMembership
                .creator(SERVICE_SID, "User0001", "premium")
                .create();

        System.out.println(segmentMembership.getSegment());
    }
}
