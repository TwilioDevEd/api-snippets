// Install the Java helper library from twilio.com/docs/java/install
import com.twilio.Twilio;
import com.twilio.rest.video.v1.Composition;
import com.twilio.rest.video.v1.Composition.Format;

public class GetCompositionMedia{

  // Find your credentials at twilio.com/console
  public static final String API_KEY_SID = "SKXXXX";
  public static final String API_KEY_SECRET = "your_api_key_secret";

  public static void main( String[] args ) throws IOException{
    // Disable HttpClient follow redirect by default
    HttpClientBuilder clientBuilder = HttpClientBuilder.create();
    clientBuilder.disableRedirectHandling();

    // Initialize the client
    TwilioRestClient restClient = new TwilioRestClient
        .Builder(API_KEY_SID, API_KEY_SECRET)
        .httpClient(new NetworkHttpClient(clientBuilder))
        .build();

    // Retrieve media location
    String compositionSid = "CJXXXX";
    Request request = new Request(
        HttpMethod.GET,
        Domains.VIDEO.toString(),
        "/v1/Compositions/" + compositionSid + "/Media?Ttl=3600",
        restClient.getRegion());

    Response response = restClient.request(request);
    JSONObject json = new JSONObject(response.getContent());
    String mediaLocation = json.getString("redirect_to");

    // For example, download the media to a local file
    FileUtils.copyURLToFile(new URL(mediaLocation), new File("myFile.mp4"));
  }
}
