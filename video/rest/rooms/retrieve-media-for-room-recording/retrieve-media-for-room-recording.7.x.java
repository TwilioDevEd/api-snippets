import com.twilio.http.HttpMethod;
import com.twilio.http.NetworkHttpClient;
import com.twilio.http.Request;
import com.twilio.http.Response;
import com.twilio.http.TwilioRestClient;
import com.twilio.rest.Domains;
import org.apache.commons.io.IOUtils;
import org.apache.http.impl.client.HttpClientBuilder;
import org.json.JSONObject;

import java.io.IOException;


public class Example {
    // Get your Account SID and Auth Token from https://twilio.com/console
    // To set up environment variables, see http://twil.io/secure
    public static final String API_KEY_SID = System.getenv("TWILIO_API_KEY_SID");;
    public static final String API_KEY_SECRET = System.getenv("TWILIO_API_KEY_SECRET");

    public static void main(String args[]) throws IOException {
        // Disable HttpClient follow redirect by default
        HttpClientBuilder clientBuilder = HttpClientBuilder.create();
        clientBuilder.disableRedirectHandling();

        // Initialize the client
        TwilioRestClient restClient = new TwilioRestClient
                .Builder(API_KEY_SID, API_KEY_SECRET)
                .httpClient(new NetworkHttpClient(clientBuilder))
                .build();

        // Retrieve media location
        String roomSid = "RMXXXXXXXXXXXXXXXXXXXXXXXXXXXXX";
        String recordingSid = "RTXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX";
        Request request = new Request(
            HttpMethod.GET,
            Domains.VIDEO.toString(),
            "/v1/Rooms/" + roomSid +
            "/Recordings/" + recordingSid +
            "/Media/",
            restClient.getRegion()
        );
        Response response = restClient.request(request);
        JSONObject json = new JSONObject(response.getContent());
        String mediaLocation = json.getString("redirect_to");

        // Retrieve media content
        String mediaContent = org.apache.http.client.fluent.Request
                .Get(mediaLocation)
                .execute()
                .handleResponse((r) ->
                        IOUtils.toString(r.getEntity().getContent()));

        System.out.println(mediaContent);
    }
}
