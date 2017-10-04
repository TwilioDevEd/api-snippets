import org.json.JSONObject;
import com.twilio.Twilio;
import com.twilio.rest.video.v1.Recording;


public class Example {
    // Find your Account Sid and Token at twilio.com/console
    public static final String API_KEY_SID = "SKXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX";
    public static final String API_KEY_SECRET = "your_api_key_secret";

    public static void main(String args[]) {

        // Initialize the client
        Twilio.init(API_KEY_SID, API_KEY_SECRET);

        String roomSid = "RMXXXXXXXXXXXXXXXXXXXXXXXXXXXXX";
        String recordingSid = "RTXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX";
        TwilioRestClient restClient = Twilio.getRestClient();
        Request request = new Request(
            HttpMethod.POST,
            Domains.VIDEO.toString(),
            "/v1/Rooms/" + roomSid +
            "/Recordings/" + recordingSid +
            "/Media/",
            restClient.getRegion()
        );
        Response response = restClient.request(request);
        String mediaLocation = json.getJSONObject(response.getStream()).getString("location");

        System.out.println(mediaLocation);
    }
}
