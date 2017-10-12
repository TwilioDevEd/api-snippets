import com.twilio.http.HttpMethod;
import com.twilio.http.Request;
import com.twilio.http.Response;
import com.twilio.http.TwilioRestClient;
import com.twilio.rest.Domains;
import com.twilio.Twilio;

import org.json.JSONObject;


public class Example {
    // Find your Account Sid and Token at twilio.com/console
    public static final String API_KEY_SID = "SKXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX";
    public static final String API_KEY_SECRET = "your_api_key_secret";

    public static void main(String args[]) {

        // Initialize the client
        Twilio.init(API_KEY_SID, API_KEY_SECRET);

        String recordingSid = "RTXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX";
        TwilioRestClient restClient = Twilio.getRestClient();
        Request request = new Request(
                HttpMethod.GET,
                Domains.VIDEO.toString(),
                "/v1/Recordings/" + recordingSid + "/Media/",
                restClient.getRegion()
        );
        Response response = restClient.request(request);
        JSONObject json = new JSONObject(response.getStream());
        String mediaLocation = json.getString("location");

        System.out.println(mediaLocation);
    }
}
